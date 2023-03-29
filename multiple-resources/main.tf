resource local_file cat_res {
  
  filename  = "cat.txt"
  sensitive_content  = "I Love cat"
  
}
resource local_file dog_res {
  
  filename  = "dog.txt"
  sensitive_content  = "I Love dog"
  
}
