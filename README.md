Expression-Parser
=================
Expression-Parser is an extendable open-source code which can parse logical and mathematical expressions using Shunting-yard algorithm and postfix evaluation into `Abstract Syntax Tree`.

# Basic Usage

You can use Expression-Parser for:

1. Parsing expression into array of tokens:

  ```ruby
  # Splits expression into single tokens
  tokens = TokenParser.new.parse('material = wood && (price > 180 || price <= 250)')
  ```
  Variable `tokens` will be array of tokens:
   ```ruby
  %w{( material = wood && ( price > 180 || price <= 250 )}
  ```
  
2. Converting tokens into postfix notation:

  ```ruby
  # Converts tokens into postfix notation (also known as RPN)
  postfix = ShuntingYard.new(tokens).posfix
  ```
  Variable `postfix` will be array of tokens in postfix notation:
  ```ruby
  %w{material wood = price 180 > price 250 <= || &&}
   ```
   
3. Building Abstract Syntax Tree:

  ```ruby
  # Builds tree from postfix
  ast = AbstractSyntaxTreeBuilder.new(postfix).build_tree
  ```
  Variable `ast` will be containing such structure:
    ```ruby
  And.new(
    Equal.new('material', 'wood'),
    Or.new(
      GreaterThan.new('price', '180'),
      LessThanEqual.new('price', '250')
    )
  )
	 ```
4. Building SQL WHERE clause:

  ```ruby
  # Builds SQL WHERE clause
  sql_where = ast.to_sql
  ```
  Variable `sql_where` will be string:
  ```ruby
  '((material = wood) AND ((price > 180) OR (price <= 250)))'
  ```
  
# Supported operators

At this point we support following list of operators and their SQL conversion:

operator | description
---------|--------------
**=**    | *Equal*
**!=**   | *Not Equal*
**>**    | *Greater Than*
**>=**   | *Greater Than Equal*
**<**    | *Less Than*
**<=**   | *Less Than Equal*
**&&**   | *Logical AND*
**\|\|**   | *Logical OR*
**-**  | *Unary Minus*

The rest of passed expression is considered as an operand i.e. either variable or a number

# Adding your own operators
TODO:
