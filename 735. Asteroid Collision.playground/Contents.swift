class Solution {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stack: [Int] = []

        for asteroid in asteroids {
            if asteroid > 0 {
                stack.append(asteroid)
            } else {
                
                while stack.count > 0 && stack.last! > 0 && stack.last! < abs(asteroid) {
                    stack.popLast()
                }

                if stack.count > 0 && stack.last! > 0 && stack.last! == abs(asteroid) {
                    stack.popLast()
                    continue
                }

                if stack.isEmpty || stack.last! < 0 {
                    stack.append(asteroid)
                }
            }
        }

        return stack
    }
}


class Solution_2 {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stack: [Int] = []

        for asteroid in asteroids {
            stack.append(asteroid)
            if asteroid < 0 {
                while stack.count > 1 {
                    stack.popLast()
                    let lastAsteroid = stack.popLast()!

                    if lastAsteroid < 0 {
                        stack.append(lastAsteroid)
                        stack.append(asteroid)
                        break
                    }

                    if lastAsteroid > abs(asteroid) {
                        stack.append(lastAsteroid)
                        break
                    } else if lastAsteroid < abs(asteroid) {
                        stack.append(asteroid)
                    } else {
                        break
                    }
                }
            }
        }

        return stack
    }
}
