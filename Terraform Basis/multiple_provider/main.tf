resource local_file sample_res {
  content = "I AM VERRY VERRY HAPPY"
  filename = "sample.txt"

}
resource random_string rst {
  length  = 10

}

output string {
  value       = random_string.rst.result
 
}
