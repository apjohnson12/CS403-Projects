
s := Smalltalk arguments size.
(s = 2)
    ifFalse: [
        (s = 4)
            ifFalse: [
                'Usage: gst employee.st salaried.st hourly.st commission.st -f payroll.st action' displayNl.
                'or' displayNl.
                'Usage: gst employee.st salaried.st hourly.st commission.st -f payroll.st action operator threshold' displayNl.
                (String with: Character nl) display.
                'Valid actions: count print min max total avg' displayNl.
                'Valid operators: eq ne gt ge lt le' displayNl.
                (String with: Character nl) display.
                ObjectMemory quit: 0
            ].
    ].

employees := OrderedCollection new.



f := FileStream open: (Smalltalk arguments at: 1) mode: FileStream read
    ifFail: [
            'Unable to open ' display.
            (Smalltalk arguments at: 1) display.
            ' for reading' displayNl.
            (String with: Character nl) display.
            ObjectMemory quit: 0
        ].
"f linesDo: [ :c | lines add: c]."
f linesDo: [ :c | 
    
    fields := (c substrings: ' ').
    "fields printNl."
    
    

    ((fields at: 1) = 'salaried')
        ifTrue: [
            
            "fn := (fields at: 2).
            ln := (fields at: 3)."
            salary := (fields at: 4) asNumber.
            newEmployee := SalariedEmployee new. 
            newEmployee type: (fields at: 1).
            newEmployee firstName: (fields at: 2). 
            newEmployee lastName: (fields at: 3). 
            newEmployee salary: salary.
            employees add: newEmployee
        ].
    ((fields at: 1) = 'commission')
        ifTrue: [
            
            "fn := (fields at: 2).
            ln := (fields at: 3)."
            minSalary := (fields at: 4) asNumber.
            sales := (fields at: 5) asNumber.
            commissionRate := (fields at: 6) asNumber.
            newEmployee := CommissionEmployee new.
            newEmployee type: (fields at: 1).
            
            newEmployee firstName: (fields at: 2).
            
            newEmployee lastName: (fields at: 3).
            newEmployee minSalary: minSalary.
            newEmployee sales: sales.
            newEmployee commissionRate: commissionRate.
            employees add: newEmployee.
            "firstName printNl.
            lastName printNl.
            commissionRate printNl." 
        ].
    ((fields at: 1) = 'hourly')
        ifTrue: [
            
            "fn := (fields at: 2).
            ln := (fields at: 3)."
            hours := (fields at: 4) asNumber.
            wage := (fields at: 5) asNumber.
            newEmployee := HourlyEmployee new.
            newEmployee type: (fields at: 1).
            newEmployee firstName: (fields at: 2).
            newEmployee lastName: (fields at: 2).
            newEmployee hours: hours.
            newEmployee wage: wage.
            employees add: newEmployee
        ].
    ].
f close.

op := (Smalltalk arguments at: 2).
(s = 4)
    ifTrue: [
        sel := (Smalltalk arguments at: 3).
        val := (Smalltalk arguments at: 4) asNumber
    ].
"op printNl.
(s = 4)
    ifTrue: [
        sel printNl.
        val printNl
    ]."
(op = 'avg')
    ifTrue: [
        sum := 0.
        employeeCount := 0
    ].
((op = 'count') | (op = 'total'))
    ifTrue: [
        sum := 0
    ].
index := 0.
most := -1.
employees do: [:each | 
    selected := true.
    index := index + 1.
    (s = 4)
        ifTrue: [
            selected := false.
            (sel = 'eq')
                ifTrue: [
                    (each earning = val)
                        ifTrue: [
                            selected := true
                        ].
                ].
            (sel = 'ne')
                ifTrue: [
                    (each earning = val)
                        ifFalse: [
                            selected := true
                        ].
                ]. 
            (sel = 'gt') 
                ifTrue: [
                    (each earning > val)
                        ifTrue: [
                            selected := true
                        ].
                ].
            (sel = 'ge')
                ifTrue: [
                    (each earning >= val) 
                        ifTrue: [
                            selected := true
                        ].
                ].
            (sel = 'lt')
                ifTrue: [
                    (each earning < val)
                        ifTrue: [
                            selected := true
                        ].
                ].
            (sel = 'le') 
                ifTrue: [
                    (each earning <= val)
                        ifTrue: [
                            selected := true
                        ].
                ].                  
        ].
    (selected)
        ifTrue: [
            (op = 'print')
                ifTrue: [
                    each info displayNl.
                    'earned $' display.
                    each earning displayNl.
                    (String with: Character nl) display.

                ].
            (op = 'avg')
                ifTrue: [
                    sum := sum + each earning.
                    employeeCount := employeeCount + 1
                ].
            (op = 'count')
                ifTrue: [
                    sum := sum + 1
                ].
            (op = 'total')
                ifTrue: [
                    sum := sum + each earning
                ].
            (op = 'min')
                ifTrue: [
                    (most > -1)
                        ifTrue: [
                            (each earning < (employees at: most) earning)
                                ifTrue: [
                                    most := index
                                ].
                                
                        ].
                    (most > -1)
                        ifFalse: [
                            most := index
                        ].
                ].
            (op = 'max')
                ifTrue: [
                    (most > -1)
                        ifTrue: [
                            (each earning > (employees at: most) earning)
                                ifTrue: [
                                    most := index
                                ].
                                
                        ].
                    (most > -1)
                        ifFalse: [
                            most := index
                        ].
                ].
        ].

].
(op = 'count')
    ifTrue: [
        'There are ' display.
        sum print.
        ' employee' displayNl.
        (String with: Character nl) display
    ].
((op = 'min') | (op = 'max'))
    ifTrue: [
        (most = -1)
            ifTrue: [
                'There are no employees' displayNl.
            ].
        (most = -1)
            ifFalse: [
                employee := (employees at: most).
                employee info displayNl.
                'earned $' display.
                employee earning displayNl.
                (String with: Character nl) display
            ].
    ].
(op = 'total')
    ifTrue: [
        'Total payment is $' display.
        sum displayNl.
        (String with: Character nl) display
    ].
(op = 'avg')
    ifTrue: [
        'Average payment per employee is $' display.
        "sum displayNl."
        "employees size printNl."
        "employeeCount displayNl."
        (sum/employeeCount) displayNl.
        (String with: Character nl) display
    ].

