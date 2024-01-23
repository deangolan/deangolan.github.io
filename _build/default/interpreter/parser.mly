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
%token LE
%token IDM 
%token COM 
%token ASO 
%token DIS
%token DN 
%token DM
%token ID
%token MP
%token MT
%token EOF

%right IFF
%right IMP
%left AND
%left OR
%nonassoc NOT

%start <Ast.t option> prog

%%


prog:
    | EOF { None }
    | e = expr; EOF { Some e }
    ;


expr:
    | p = prop; COLON; r = rule { {prop = p; derivedby = r } }
    ;


prop:
    | a = ATOM { `Atom a }
    | b = BOOL { `Bool b }
    | p1 = prop; OR; p2 = prop { `Conn (`Or, p1, p2) }
    | p1 = prop; AND; p2 = prop { `Conn (`And, p1, p2) }
    | p1 = prop; IMP; p2 = prop { `Conn (`Impl, p1, p2) }
    | p1 = prop; IFF; p2 = prop { `Conn (`Iff, p1, p2) }
    | NOT; e = prop { `Not (e) }
    | LPAREN; e = prop; RPAREN { e } 
    ;


rule:
    | PR { `Premise }
    | LE; i = INT { `LE i }
    | IDM; i = INT { `Idempotence i }
    | COM; i = INT { `Commutative i }
    | ASO; i = INT { `Associative i }
    | DIS; i = INT { `Distributive i }
    | DN; i = INT { `DoubleNegation i }
    | DM; i = INT { `DeMorgan i }
    | ID; i = INT { `Identity i }
    | MP; i1 = INT; COMMA; i2 = INT { `ModusPonens (i1, i2) }
    | MT; i1 = INT; COMMA; i2 = INT { `ModusTollens (i1, i2) }
    ;
