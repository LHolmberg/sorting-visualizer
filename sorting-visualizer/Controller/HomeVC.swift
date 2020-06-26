import UIKit

class HomeVC: UIViewController {
    let segueID = "toVisualizer"
    
    @IBAction func BubbleSortBtn(_ sender: Any) {
        performSegue(withIdentifier: segueID, sender: "bubblesort")
    }
    
    @IBAction func SelectionSortBtn(_ sender: Any) {
        performSegue(withIdentifier: segueID, sender: "selectionsort")
    }
    
    @IBAction func ShellSortBtn(_ sender: Any) {
        performSegue(withIdentifier: segueID, sender: "shellsort")
    }
    
    @IBAction func BogoSortBtn(_ sender: Any) {
        performSegue(withIdentifier: segueID, sender: "bogosort")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        if(segue.identifier == "toVisualizer") {
            if let algo = sender as? String {
                let visualizerVC = segue.destination as! VisualizerVC
                visualizerVC.algorithm = algo
            }
        }
    }
}
