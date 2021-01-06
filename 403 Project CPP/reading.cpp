#include "reading.h"
#include <fstream>
#include <string.h>

using namespace std;

vector<Employee*> *readFrom(string filename) {
    ifstream file(filename.c_str());
    string line;
    //char c;
    vector<Employee*>* result = new vector<Employee*>();
    char firstName[100], lastName[100], type[100];
    double one, two, three;

    while (getline(file, line)) {
        
        int tokens = sscanf(line.c_str(), "%s %s %s %lf %lf %lf", type, firstName, lastName, &one, &two, &three);
        if (tokens > 0) {
            if (strcmp(type, "salaried") == 0) {
                result->push_back(new SalariedEmployee(string(firstName), string(lastName), one));
            }
            else if (strcmp(type, "hourly") == 0) {
                result->push_back(new HourlyEmployee(string(firstName), string(lastName), one, two));
            }
            else if (strcmp(type, "commission") == 0) {
                result->push_back(new CommissionEmployee(string(firstName), string(lastName), one, two, three));
            }
        }
    }
    file.close();



    return result;
}



