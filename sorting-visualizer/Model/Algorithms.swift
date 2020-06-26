import Foundation

class Algorithms {
    static let instance = Algorithms()
    
    func BubbleSort(_ array: inout [Int]) -> [Int] {
        for i in 0..<array.count {
            for j in 1..<array.count - i {
                if array[j] < array[j-1] {
                    let tmp = array[j-1]
                    array[j-1] = array[j]
                    array[j] = tmp
                    return array
                }
            }
        }
        return array
    }
    
      func ShellSort(_ array: inout [Int]) -> [Int] {
            let length = array.count
            var h = 1
            
            while h < length / 3 {
                h = 3 * h + 1
            }
            
            while h >= 1 {
                for i in h..<length {
                    for j in stride(from: i, to: h - 1, by: -h) {
                        if array[j] < array[j - h] {
                            array.swapAt(j, j - h)
                            return array
                        } else {
                            break
                        }
                    }
                }
                h /= 3
            }
            
            return array
        }
    
    func SelectionSort(_ array: inout [Int]) -> [Int] {
        for iterationIndex in 0 ..< array.count - 1 {
          
          var minIndex = iterationIndex
          
          for compareIndex in iterationIndex + 1 ..< array.count {
            if array[compareIndex] < array[minIndex] {
                minIndex = compareIndex
                array.swapAt(iterationIndex, minIndex)
                return array
            }
          }
          
        }
        return array
    }
    
    public func ShellSort(_ array: [Int]) -> [Int] {
        var result = array
        
        let length = result.count
        
        for i in 1..<length {
            for j in stride(from: i, to: 0, by: -1) {
                if result[j] < result[j - 1] {
                    result.swapAt(j, j - 1)
                    return result
                } else {
                    break
                }
            }
        }
        
        return result
    }
    
    //MARK: Bogo sort
    
    func IsSorted(_ a: [Int]) -> Bool
    {
        var i = 0
        while(i < a.count - 1)
        {
            if a[i] > a[i+1] {
                return false;
            }
            i += 1
        }
        return true;
    }

    
    func Shuffle(_ a: inout [Int])
    {
        for i in 0...a.count-1 {
            a.swapAt(i, Int.random(in: 0...a.count-1))
        }
    }
      
    func BogoSort(_ array: inout [Int]) -> [Int]
    {
        while (!IsSorted(array)) {
            Shuffle(&array)
            return array
        }
        return array
    }
}
