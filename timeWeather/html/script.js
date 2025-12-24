window.addEventListener("message", function (event) {
    if (event.data.action === "toggle") {
        document.body.style.display = event.data.state ? "block" : "none";
    }
});

function setTime(hour) {
    fetch(`https://${GetParentResourceName()}/setTime`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ hour: hour })
    });
}

function setWeather(weather) {
    fetch(`https://${GetParentResourceName()}/setWeather`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ weather: weather })
    });
}

function closeUI() {
    fetch(`https://${GetParentResourceName()}/close`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({})
    });
}

document.addEventListener("keydown", function (event) {
    if (event.key === "Escape") {
        closeUI();
    }
});


window.addEventListener("message", function (event) {
    if (event.data.action === "toggle") {
        document.body.style.display = event.data.state ? "block" : "none";
        document.body.style.pointerEvents = event.data.state ? "auto" : "none";
    }
});
