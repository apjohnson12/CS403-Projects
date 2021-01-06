Employee subclass: CommissionEmployee [

    | minSalary sales commissionRate |

    init [
        <category: 'initialization'>
        minSalary := 0.00.
        sales := 0.00.
        commissionRate := 0.00.
        ^super init
    ]


    minSalary: min [
        minSalary := min
    ]

    sales: amount [
        sales := amount
    ]

    commissionRate: rate [
        commissionRate := rate
    ]

    info [
        | percentage |
        percentage := commissionRate * 100.
        ^('Commission employee: ' , super info , (String with: Character nl) , 'minimum salary: ' , (minSalary asString) , ', sales amount: ' , (sales asString) , ', commission rate: ' , (percentage asString) , '%')
    ]

    earning [
        (minSalary > (sales*commissionRate))
            ifTrue: [^minSalary]
            ifFalse: [^(sales*commissionRate)].
    ]

]