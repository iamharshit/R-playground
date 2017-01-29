"
Outputs all the professors's names in some department of IIT Kharagpur
"

library(data.table)
library(XML)

dept_initials<-list("AE","AG","AR","BT","CH","CY","CE","CS","EE","EC","GG","HS","IM","MA","ME","MT","MI","NA","PH")
names(dept_initials)<-c("Aerospace","Agriculture","Architecture","Biotecnology","Chemical","Chemistry","Civil","Computer Science","Electrical","Electronics","Geology","Humanities","Industrial","Mathematics","Mechanical","Mettalurgy","Mining","Ocean and Naval","Physics")

#printing dept names and getting user input
for(i in names(dept_initials)){
	print(i)
}
department<-readline("Enter department name: ")

#crawling website
url <- paste("http://iitkgp.ac.in/department/",dept_initials$department)
doc <- htmlParse(url)
xpath<-'//*[@id="content_size"]/div[2]/div/div[3]/div/div/div[4]/div/div[1]/a'
locations<-getNodeSet(doc,xpath)

print("---------------------------------")

#printing all professors name
data.frame(sapply(locations, function(x) {xmlValue(x)}))
