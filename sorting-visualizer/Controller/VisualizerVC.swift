import UIKit

class VisualizerVC: UIViewController {
    var algorithm: String = ""
    @IBOutlet weak var algorithmTxt: UILabel!
    
    var array: [Int] = []
    var stapleArray: [ArrayValueBar] = []
    
    var deltaWidth: Int = 0
    var sortingSpeedDivisor: Int = 100
    
    @IBOutlet weak var sortingSpeed: UISegmentedControl!
    var shouldSort: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sortingSpeed.addTarget(self, action: #selector(SortingSpeedChanged(sender:)), for: .valueChanged)
        initArray()

        switch algorithm {
        case "bubblesort":
            algorithmTxt.text = "Bubble sort"
        case "selectionsort":
            algorithmTxt.text = "Selection sort"
        case "shellsort":
            algorithmTxt.text = "Shell sort"
        case "bogosort":
            algorithmTxt.text = "Bogo sort"
        default:
            algorithmTxt.text = ""
        }
    }
    
    @IBAction func StartBtn(_ sender: Any) {
        shouldSort = true

        DispatchQueue.global(qos: .default).async {
            while self.array != self.array.sorted() && self.shouldSort == true {
                self.UpdateArray()
                DispatchQueue.main.async {
                    self.UpdateView(arr: self.stapleArray, values: self.array)
                }
                usleep(useconds_t(1000000 / self.sortingSpeedDivisor))
             }
         }
     }
    
    @IBAction func StopBtn(_ sender: Any) {
        shouldSort = false
    }
    
    @IBAction func GenerateNewArrayBtn(_ sender: Any) {
        GenerateArray()
        UpdateView(arr: stapleArray, values: array)
    }
    
    func initArray() {
        GenerateArray()

        deltaWidth = Int((self.view.frame.width - 313)) / 2
        let width = 2
        
        for i in 0...array.count - 1 {
            stapleArray.append((ArrayValueBar(frame: CGRect(x: Int(deltaWidth) + 3 * i,
                                                            y: Int(self.view.frame.height) - 184,
                                                            width: width, height: array[i] * -2))))
            view.addSubview(stapleArray[i])
        }
    }

    @IBAction func BackBtn(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc func SortingSpeedChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            sortingSpeedDivisor = 100
        case 1:
            sortingSpeedDivisor = 500
        case 2:
            sortingSpeedDivisor = 1500
        default:
            break
        }
    }
    
    func GenerateArray() {
          array = []
          for _ in 0...100 {
            while true {
                let val = Int.random(in: 1...165)
                if (!array.contains(val)) {
                    array.append(val)
                    break
                }
            }
        }
        array.append(0)
    }
    
    func UpdateView(arr: [ArrayValueBar], values: [Int]) {
        var n = 0
        for i in arr {
            i.frame.y = self.view.frame.height - 130
            i.frame.height = CGFloat(values[n] * -2)
            n += 1
        }
    }
    
    func UpdateArray() {
        switch(algorithm) {
        case "bubblesort":
            array = Algorithms.instance.BubbleSort(&array)
        case "selectionsort":
            array = Algorithms.instance.SelectionSort(&array)
        case "shellsort":
            array = Algorithms.instance.ShellSort(&array)
        case "bogosort":
            array = Algorithms.instance.BogoSort(&array)
        default:
            break
        }
    }
}
