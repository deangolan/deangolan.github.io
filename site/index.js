import * as Prooftree from "./prooftree"

const displayValid = document.getElementById("displayValid");

const proof = {
    lines : document.getElementById('lines'),
    num : 1,

    addLine : function() {
        this.num++;
        const newLine = document.createElement('div');
        newLine.classList.add('linenum');
        newLine.id = 'linenum' + this.num

        const row = document.createElement("span");
        row.textContent = this.num + '.'

        const input = document.createElement("input");
        input.type = 'text';
        input.id = 'input' + this.num;
        input.onKeyDown = function (event) {
            handleKeyDown(event, proof.num);
        };
        newLine.onBlur = function (event) {
            handleBlur(proof.num);
        };

        const output = document.createElement('span');
        output.classList.add('output');
        output.id = 'output' + this.num;

        newLine.appendChild(row);
        newLine.appendChild(input);
        newLine.appendChild(output);

        lines.appendChild(newLine);

        input.focus();
    },

    evalLine : function (linenum) {
        const prop = document.getElementById('input' + linenum).value;
        document.getElementById('output' + linenum).textContent = Prooftree.interp(prop);
        try {
            displayValid.textContent = Prooftree.editLine(linenum, prop) ? 'Valid' : 'Invalid';
        } catch (error) {
            if (error instanceof Prooftree.SyntaxError || error Prooftree.instanceof ) 
            displayValid.textContent = error.message;
            else {
                throw error
            }
        }
    },

/*    removeLine : function (linenum) {
       //TODO 
    }*/
}

function handleKeyDown(event, linenum) {
    console.log("Enter pressed");
    if (event.key === 'Enter') {
        event.preventDefault();
        if (linenum === proof.num) {
            proof.addLine();
        }
    }
}

function handleBlur(linenum) {
    proof.evalLine(linenum);
}
