import { interp, editLine, deleteLine } from "prooftree.js";

const app = Elm.Main.init({
    node: document.getElementById('myapp')  
});

app.ports.sendProof.subscribe(function(proof) {
    app.ports.receiveEval.send(Prooftree.eval(proof));
});

