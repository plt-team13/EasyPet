/*******************************************************************************
 * Scanner for EasyPet Program
 *
 * Author: Team 13
 *
 ******************************************************************************/

%%

%class Scanner
%unicode
%cup
%line
%column

%{

  /**
   * Return a new Symbol with the given token id, and with the current line
   * and column numbers
   *
   */
  public Symbol token(int tokenId) {
    return new Symbol(tokenId, yyline, yycolumn);
  }

  /**
   * Return a new Symbol with the given token id, the current line and column
   * numbers, and the given token value. The value is used for tokens such as
   * identifiers, numbers and operators
   */
  public Symbol token(int tokenId, Object value) {
    return new Symbol(tokenId, yyline, yycolumn, value);
  }

%}

/* pattern definition */
LineTerminator     = \r|\n| \r\n
InputCharacter     = [^\r\n]

WHITESPACE         = {LineTerminator} | [ \t\f]

TraditionalComment = "/*" [^*] ~"*/" | "/*" "*"+ "/"
EndOfLineComment   = "//" {InputCharacter}* {LineTerminator}

COMMENT            = {TraditionalComment} | {EndOfLineComment}

ID                 = [a-zA-Z][a-zA-Z0-9]*
INTEGER            = 0 | [1-9][0-9]*
DOUBLE             = [0-9]+ ("."[0-9]+)?

%%

/* keywords */

"arraylist"        { return token(sym.ARRAYLIST);}
"break"            { return token(sym.BREAK);}
"continue"         { return token(sym.CONTINUE);}
"def"              { return token(sym.DEF);}
"def_btn"          { return token(sym.DEF_BTN);}
"def_timer"        { return token(sym.DEF_TIMER);}
"do"               { return token(sym.DO);}
"double"           { return token(sym.DOUBLE);}
"extends"          { return token(sym.EXTENDS);}
"false"            { return token(sym.FALSE);}
"final"            { return token(sym.FINAL);}
"for"              { return token(sym.FOR);}
"if"               { return token(sym.IF);}
"Image"            { return token(sym.IMAGE);}
"int"              { return token(sym.INTEGER);}
"Item"             { return token(sym.ITEM);}
"Panel"            { return token(sym.PANEL);}
"Pet"              { return token(sym.PET);}
"return"           { return token(sym.RETURN);}
"Sound"            { return token(sym.SOUND);}
"string"           { return token(sym.STRING);}
"true"             { return token(sym.TRUE);}
"void"             { return token(sym.VOID);}
"while"            { return token(sym.WHILE);}

/* comment */
{COMMENT}          {/* Ignored*/}

/* white space */
{WHITESPACE}       {/* Ignored*/}
 
/* operators */
"+"                { return token(sym.PLUS);}
"-"                { return token(sym.MINUS);}
"*"                { return token(sym.TIMES);}
"/"                { return token(sym.DIVIDE);}
"="                { return token(sym.ASSIGN);}
"<"                { return token(sym.LESS);}
"<="               { return token(sym.LESS_EQUAL);}
">="               { return token(sym.GREATER_EQUAL)}
">"                { return token(sym.GREATER);}
"=="               { return token(sym.EQUAL);}
"!="               { return token(sym.NOT_EQUAL);}
"{"                { return token(sym.LEFT_BRACKET);}
"}"                { return token(sym.RIGHT_BRACKET);}
"("                { return token(sym.LEFT_PARENTHESE);}
")"                { return token(sym.RIGHT_PARENTHESE);}
"||"               { return token(sym.OR);}
"&&"               { return token(sym.AND);}

/* separator */
"."                { return token(sym.DOT);}

/* identifier */
{ID}               { return token(sym.ID, yytext()); }

/* number */
{INTEGER}          { return token(sym.INTEGER, new Integer(yytext()));}
{DOUBLE}           { return token(sym.DOUBLE, new Double(yytext()));}
