Employee subclass: SalariedEmployee [

    | salary |

    init [
        <category: 'initialization'>
        salary := 0.00.
        
        ^super init
    ]


    salary: amount [
        salary := amount
    ]

    info [
        ^('Salaried Employee: ' , super info , (String with: Character nl) , 'weekly Salary: ' , (salary asString))
    ]

    earning [
        ^salary
    ]

]