import { interp, editLine, deleteLine } from "prooftree.js";

const app = Elm.Main.init({
    node: document.getElementById('myapp')  
});

app.ports.sendMessage.subscribe(function(proof) {
    Prooftree.eval(proof);
});

app.
