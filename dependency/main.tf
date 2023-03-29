resource local_file name1 {
 filename = "implicit.txt"
 content = "This is random String : ${random_string.name2.result}"
}
resource random_string name2 {
  length  = 5

}

 