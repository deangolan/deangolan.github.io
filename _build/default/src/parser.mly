%token <string> ATOM 
%token <bool> BOOL
%token <int> INT
%token COLON
%token COMMA
%token OR
%token AND
%token NOT
%token IMP
%token IFF
%token LPAREN
%token RPAREN
%token PR
%token ID
%token MT
%token EOF

%left COLON
%left IFF
%left IMP
%left AND
%left OR
%nonassoc NOT

%start <Ast.line option> prog

%%


prog:
    | EOF { None }
    | e = expr; EOF { Some e }
    ;


expr:
    | p = prop; COLON; r = rule { {proposition = p; derivedby = r } }
    ;


prop:
    | a = ATOM { `Atom a }
    | b = BOOL { `Bool b }
    | p1 = prop; OR; p2 = prop { `Conn (`Or, p1, p2) }
    | p1 = prop; AND; p2 = prop { `Conn (`And, p1, p2) }
    | p1 = prop; IMP; p2 = prop { `Conn (`Imp, p1, p2) }
    | p1 = prop; IFF; p2 = prop { `Conn (`Iff, p1, p2) }
    | NOT; e = prop { `Not (e) }
    | LPAREN; e = prop; RPAREN { e } 
    ;


rule:
    | PR { `Premise }
    | ID; i = INT { `Identity i }
    | MT; i1 = INT; COMMA; i2 = INT { `ModusTollens (i1, i2) }
    ;
