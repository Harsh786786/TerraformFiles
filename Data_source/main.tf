data local_file reading {
  filename = "readfile.txt"
}
output print {
  value= data.local_file.reading
}

