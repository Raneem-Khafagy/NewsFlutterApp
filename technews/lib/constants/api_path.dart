//used singleton pattern to restrict the instantiation of a class to one "single" instance as Api objects needs to coordinate actions across the system. 

// all API endpoints

//manage an object '_instance' and return this object instance 
// class MySingletonClass {

//   static final MySingletonClass _instance = 
//     MySingletonClass ._internal();

//   // passes the instantiation to the _instance object
//   factory MySingletonClass() => _instance;

// }

//The _internal method can be used to initialize variables:
// class MySingletonClass {

//   [...]

//   //initialize variables in here
//   MySingletonClass._internal() {
//     //_myVariable has to be defined before
//     _myVariable = 0;
//   }
// }

//To use it in an existing widget, we get the instance object of the class just as we would create a new instance. This is usually done within a 'State<>' object:
// class _MyHomePageState extends State<MyHomePage> {
//   MySingletonClass _mySingletonClass = MySingletonClass();

//   [...]
// }

const apiKey = "827ffc0417e348d09c98e8bcabc54120";
String category='', country='' ,language ='';
class ApiPath{
  static String defult_url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=${apiKey}";
   get_api_path(String category,String country, String language){
     
   String url = "http://newsapi.org/v2/top-headlines?category=${category}&apiKey=${apiKey}";
  }
}

