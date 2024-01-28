%token <string> ATOM 
%token <bool> BOOL
%token <int> INT
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

%left IFF
%right IMP
%left AND
%left OR
%nonassoc NOT

%start <Ast.t list> prog

%%

prog:
    | h = expr; t = prog { h :: t }
    | EOF { [] }
    ;

expr:
    | p = prop; PR { Premise p }
    | q = prop; LE; i = INT { EquivalenceRule (LE, Lineref i, q) }
    | q = prop; IDM; i = INT { EquivalenceRule (Idempotence, Lineref i, q) }
    | q = prop; COM; i = INT { EquivalenceRule (Commutative, Lineref i, q) }
    | q = prop; ASO; i = INT { EquivalenceRule (Associative, Lineref i, q) }
    | q = prop; DIS; i = INT { EquivalenceRule (Distributive, Lineref i, q) }
    | q = prop; DN;  i = INT { EquivalenceRule (DoubleNegation, Lineref i, q) }
    | q = prop; DM; i = INT { EquivalenceRule (DeMorgan, Lineref i, q) }
    | q = prop; ID; i = INT { EquivalenceRule (Identity, Lineref i, q) }
    | q = prop; MP; i1 = INT; COMMA; i2 = INT { ImplicationRule (ModusPonens, Lineref i1, Lineref i2, q) }
    | q = prop; MT; i1 = INT; COMMA; i2 = INT { ImplicationRule (ModusTollens, Lineref i1, Lineref i2, q) }
    ;

prop:
    | a = ATOM { `Atom a }
    | b = BOOL { `Bool b }
    | p1 = prop; OR; p2 = prop { `Conn (`Or, p1, p2) }
    | p1 = prop; AND; p2 = prop { `Conn (`And, p1, p2) }
    | p1 = prop; IMP; p2 = prop { `Conn (`Impl, p1, p2) }
    | p1 = prop; IFF; p2 = prop { `Conn (`Iff, p1, p2) }
    | NOT; p = prop { `Not (p) }
    | LPAREN; p = prop; RPAREN { p } 
    ;
