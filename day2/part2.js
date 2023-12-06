var fs = require('fs');
 
var data = fs.readFileSync('input.txt', 'utf8');
inputLines = data.split("\n")

const redCubes = 12
const greenCubes = 13
const blueCubes = 14

const colors = ["red", "green", "blue"]

minimumCubes = []

inputLines.forEach(line => {
    cubeAmount = [0, 0, 0]
    line = line.substring(line.indexOf(": ") + 1);
    gameSets = line.split("; ")
    gameSets.forEach(set => {
        set = set.trim().replaceAll(" ", "").split(",")
        set.forEach(ball => {
            colors.forEach((color, index) => {
                if (ball.includes(color)) {
                    colorAmount = parseInt(ball.replace(color, ""))
                    if (cubeAmount[index] < colorAmount) {
                        cubeAmount[index] = colorAmount
                    }
                }
            })
        })
    })
    minimumCubes.push(cubeAmount)
});

sum = 0
minimumCubes.forEach(numbersList => {
    sum += numbersList[0] * numbersList[1] * numbersList[2] 
})

console.log(sum)

