--
-- Global Lua definitions
------------------------------------------------------------
--
--math.randomseed( os.time() )
math.randomseed(2014)
--
-- Number Rounding
function round(val, decimal)
    local exp = decimal and 10^decimal or 1
    return math.ceil(val * exp - 0.5) / exp
end
--
-- Random Permutation
function permute(tab, n, count)
    n = n or #tab
    for i = 1, count or n do
        local j = math.random(i, n)
        tab[i], tab[j] = tab[j], tab[i]
    end
    return tab
end
--
-- Normal Distribution
-- mean 1, standard deviation 0.5
function normal()
    local value = 1 + math.sqrt(-2 * math.log(math.random())) *
                       math.cos(2 * math.pi * math.random()) / 2
    return value
end
--
-- Gaussian Random Number (Box-Muller)
function gaussian()
    local S,v1,v2,x = 0,0,0,0
    while S>=1 or S==0 do
        v1 = 2*math.random() - 1
        v2 = 2*math.random() - 1
        S = v1*v1 + v2*v2
    end
    --x = v2 * math.sqrt(-2*math.log(S)/S)
    y = v1 * math.sqrt(-2*math.log(S)/S)
    return y
end
--
-- Derived and Defined
derived = {
    'hertz', 'radian', 'steradian', 'newton',
    'pascal', 'joule', 'watt', 'coulomb', 'volt',
    'farad', 'ohm', 'siemens', 'weber', 'tesla',
    'henry', 'degree Celsius', 'lumen', 'lux',
    'becquerel', 'gray', 'sievert', 'katal'
}
defined = {
    'meter', 'kilogram', 'second', 'ampere',
    'kelvin', 'candela', 'mole'
}
--
-- Miscellaneous
nwrong = 5
ncol = 3
--
-- Center
BeginCenter = [[ \begin{center} ]]
EndCenter = [[ \end{center} ]]
--
-- AMCNumeric
AMCnumeric = [[ \AMCnumericChoices{%f}{%s} ]]
--
-- Multicols {N}
BeginMulticolsN = [[ \begin{multicols}{%u} ]]
-- Multicols {2}
BeginMulticolsTwo = [[ \begin{multicols}{2} ]]
-- Multicols {3}
BeginMulticolsThree = [[ \begin{multicols}{3} ]]
-- Multicols {4}
BeginMulticolsFour = [[ \begin{multicols}{4} ]]
-- EndMulticols
EndMulticols = [[ \end{multicols} ]]
--
-- Choices
BeginChoices = [[ \begin{choices} ]]
EndChoices = [[ \end{choices} ]]
--
-- Wrong and Correct
CorrectChoice = [[ \correctchoice{%s} ]]
WrongChoice = [[ \wrongchoice{%s} ]]
--
-- End Of File
--
