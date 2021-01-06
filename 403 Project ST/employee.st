Object subclass: Employee [

    | firstName lastName type|

    Employee class >> new [
        <category: 'instance creation'>
        | r |
        r := super new.
        r init.
        ^r
    ]

    init [
        <category: 'initialization'>
        firstName := ''.
        lastName := ''.
        type := ''
    ]

    type: employeeType [
        type := employeeType
    ]



    firstName: name [
        firstName := name
    ]

    lastName: name [
        lastName := name
    ]

    info [
        ^(firstName , ' ' , lastName)
    ]

    earning [
        ^0.00
    ]
    
]