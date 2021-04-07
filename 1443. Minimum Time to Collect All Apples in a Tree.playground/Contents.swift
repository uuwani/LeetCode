class Solution {
    var minTime: Int = 0

    var edges: [[Int]] = []

    var hasApple: [Bool] = []

    func minTime(_ n: Int, _ edges: [[Int]], _ hasApple: [Bool]) -> Int {
        self.edges = edges.sorted { $0[0] < $1[0] }
        print(self.edges)
        self.hasApple = hasApple

        self.searchApple(startVertex: 0)

        return minTime
    }

    func searchApple(startVertex: Int) -> Bool {
        var result: Bool = false

        while true {
            if self.edges.isEmpty {
                break
            }

            let info = self.findIndexBy(startVertex)
            if let index = info.index {
                // print("startVertex: \(startVertex)")
                let currentVertex = self.edges[index][info.position]
                let nextVertex = self.edges[index][info.position == 0 ? 1 : 0]
                self.edges.remove(at: index)

                let searchResult = searchApple(startVertex: nextVertex)
                result = result ? result : searchResult
                self.minTime += searchResult ? 2 : 0
            } else {
                break
            }
        }

        return result ? result : self.hasApple[startVertex]
    }

    func findIndexBy(_ vertex: Int) -> (index: Int?, position: Int) {
        var index: Int! = 0
        var position = 0

        while index < self.edges.count {
            if vertex == self.edges[index][0] {
                position = 0
                break
            } else if vertex == self.edges[index][1] {
                position = 1
                break
            } else if vertex < self.edges[index][0] {
                print("ban : \(vertex)")
                index = nil
                break
            }
            
            index += 1
        }

        return index == self.edges.count ? (nil, position) : (index, position)
    }
}
