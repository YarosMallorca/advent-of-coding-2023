import java.io.File

fun main () {
    val inputLines = File("input.txt").readLines();

    var totalPoints = 0;

    for (line in inputLines) {
        val currentCard = line.split(": ")[1]
        val winningNumbers = currentCard.split(" | ")[0].split(" ")
        val yourNumbers = currentCard.split(" | ")[1].split(" ")

        var gamePoints = 0;
        for (value in winningNumbers) {
            if (value.isBlank()) continue
            if (value in yourNumbers) {
                if (gamePoints == 0) {
                    gamePoints++;
                }
                else {
                    gamePoints *= 2;
                }
            }
        }
        totalPoints += gamePoints;
    }
    println(totalPoints);
}
