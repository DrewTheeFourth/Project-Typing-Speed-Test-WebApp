let startTime;
let passage = "The quick brown fox jumps over the lazy dog."; // Example passage
let userInput = document.getElementById("user-input");
let passageDisplay = document.getElementById("passage");

document.getElementById("start-button").onclick = function() {
    startTest();
};

function startTest() {
    userInput.value = "";
    passageDisplay.innerText = passage;
    startTime = new Date();
}

userInput.addEventListener("input", function() {
    let elapsedTime = (new Date() - startTime) / 1000; // seconds
    let wordsTyped = userInput.value.split(" ").length;

    // Calculate WPM (words per minute)
    let wpm = Math.round((wordsTyped / elapsedTime) * 60);

    // Calculate accuracy
    let correctChars = getCorrectCharacters(userInput.value);
    let accuracy = Math.round((correctChars / passage.length) * 100);

    document.getElementById("speed").innerText = wpm;
    document.getElementById("accuracy").innerText = accuracy;
});

function getCorrectCharacters(input) {
    let correctCount = 0;
    for (let i = 0; i < Math.min(input.length, passage.length); i++) {
        if (input[i] === passage[i]) correctCount++;
    }
    return correctCount;
}
