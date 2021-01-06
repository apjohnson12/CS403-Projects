Employee subclass: HourlyEmployee [

    | hours wage |

    init [
        <category: 'initialization'>
        hours := 0.00.
        wage := 0.00.
        
        ^super init
    ]


    hours: hoursWorked [
        hours := hoursWorked
    ]

    wage: rate [
        wage := rate
    ]

    info [
        ^('Hourly Employee: ' , super info , (String with: Character nl) , 'hours worked: ' , (hours asString) , ', hourly rate: ' , (wage asString))
    ]

    earning [
        | pay |
        pay := hours * wage.

        (hours > 40)
            ifTrue: [pay := pay + ((hours - 40) * (wage/2))].
        
        (hours > 50)
            ifTrue: [pay := pay + ((hours - 50) * (wage/2))].
        
        ^pay
    ]

]