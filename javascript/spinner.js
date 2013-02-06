var spin = null;

function showspinner() {
    if (spinshow != true) {
        spin = document.createElement("div");
        var spinnerDivs = "<div class='spinner'><div class='bar1'></div><div class='bar2'></div><div class='bar3'></div><div class='bar4'></div><div class='bar5'></div><div class='bar6'></div><div class='bar7'></div><div class='bar8'></div><div class='bar9'></div><div class='bar10'></div><div class='bar11'></div><div class='bar12'></div></div>";
        spin.className = "container";
        spin.innerHTML = spinnerDivs;
        spin.clientHeight

        spin.style.top = ((window.innerHeight - 63) / 2) + "px";
        spin.style.left = ((window.innerWidth - 62) / 2) + "px";
        spin.style.position = "absolute";


        document.body.appendChild(spin);
        spinshow = true;
    }
}

function hidespinner() {
    if (spinshow == true) {
        document.body.removeChild(spin);
        spinshow = false;
    }

}

function flip() {
    var card = document.getElementById("main");
    card.className = "flipped";
}