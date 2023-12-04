var fs = require('fs');
 
var data = fs.readFileSync('input.txt', 'utf8');
inputLines = data.split("\n")

const redCubes = 12
const greenCubes = 13
const blueCubes = 14

const colors = ["red", "green", "blue"]

possibleGames = []

inputLines.forEach((line, index) => {
    line = line.substring(line.indexOf(": ") + 1);
    gameSets = line.split("; ")
    possibleSets = []
    gameSets.forEach(set => {
        cubeAmount = [0, 0, 0]
        set = set.trim().replaceAll(" ", "").split(",")
        set.forEach(ball => {
            colors.forEach((color, index) => {
                if (ball.includes(color)) {
                    cubeAmount[index] += parseInt(ball.replace(color, ""))
                }
            })
        })
        if (redCubes >= cubeAmount[0] && greenCubes >= cubeAmount[1] && blueCubes >= cubeAmount[2]) {
            possibleSets.push(true)
        }
        else {
            possibleSets.push(false)
        }
    })
    if (possibleSets.every(x => x)) {
        possibleGames.push(index + 1)
    }
});

console.log(possibleGames.reduce((a, b) => a + b, 0))

