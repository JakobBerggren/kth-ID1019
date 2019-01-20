defmodule Deriv do
    
    @type constant() :: {:const, number()} | {:const, atom()}
    @type literal() :: constant() | {:var, atom()}
    @type expr() :: {:exp, constant(), literal(), integer()} | {:mul, constant(), literal()} | literal()
    
    def deriv({:const, _}, _) do ... end
    def deriv({:var, v}, v) do ... end
    def deriv({:var, y}, _) do ... end
    
    
    def deriv({:mul, e1, e2}, v) do ... end
    def deriv({:add, e1, e2}, v) do ... end
    



    #SIMPLIFY

    def simplify({:const, c}) do ... end
    def simplify({:var, c}) do ... end
end