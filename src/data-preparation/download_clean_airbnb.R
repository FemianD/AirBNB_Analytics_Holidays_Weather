#Packages
library(dplyr)
library(tidyverse)
library(haven)

# Read csv.gz from url
grabremote <- function(file_url) {
  print(paste("Now downloading", cities[counter]))
  con <- gzcon(url(file_url))
  txt <- readLines(con)
  print(paste(cities[counter], "downloaded!"))
  return(read.csv(textConnection(txt)))
}

#Clean AirBNB dataframes
cleaning <- function(city) {
  city <- city %>%
    group_by(date) %>% 
    mutate(avg_price = mean(parse_number(price), na.rm=TRUE)) %>% 
    distinct(date, avg_price, .keep_all = T) %>% 
    select(date, avg_price) %>% 
    mutate(date = as.Date(date))
}

#creating lists
cities<-c("amsterdam", "athens", "berlin", "brussels", "dublin", "madrid",  "rome", "vienna", "paris", "lisbon")
urls<-curls<-c("https://public.am.files.1drv.com/y4m2F3nuGXui_LiLgbnepikKGFGoZERfyXI-toUu0Tib2jsVS-0o9RJkO4utrI_KgLhWb6gSeRdn9emj0kjhq8yT1a-DXJdWTYT_DmzkyYjsn4Y5DMYlfc8_py98XZoIQkx91KQejSBHAmSLb_jC5o6vKtVUN8CLVYl--lO5ajzWuzp_DzRwJMo94SC6vvWA7NPDsVE6lt3MMfy2hkL-wbgTAS5nC229YOZa2nVVtYU0zg", 
        "https://public.am.files.1drv.com/y4mApu_U4PElT4xMeYfYLH7gHOikc7oVl6BjU1s7JkCjT2Jx6G4OjAUnfiEhfLpTj3qrR0l5kdrIq_dFujndd2aveUUJLB3Ubd21Bnct6EFKL-5ISrt7iR34_OZoglPnNKuufRm7tO420aYXGvNHvpXVCte_fMkkLD0fa5zf6NPrL124ekFwsRgaMIkKxBemormMbeVO3cj6fGDgWro8CFhXB7uA2euLmDr2q-R30KPCLQ", 
        "https://public.am.files.1drv.com/y4m7VeqbjdgbGcXdUi8qc1n9lif2bZezhjJrmlQjBPKO6fgi7hRvYz1lCyLvxAuBk9UeR2ouNuOuBU3Tf7MqyZuIFtOG4_GskAi2e2EzFlOh_au5ee84YYz-gQvMveRRZwSnZfvwQY3hf0U9OLMiX_r_4mL284p9DYpiLd8Zc6XgyOWvLIf0iPDKmiHdYRwqkX0VgZNFcx4gUYE9fqRghafsPrPi2tHS5QeoFB-SWND8zs", 
        "https://public.am.files.1drv.com/y4mgT6acUjhZ7WdARa_YZ2QEbX8xx5D8aWGc4vgLyyguTBqvvmAuVLy1diWBYr8V-x4Lyi1TIMUnV2aorE6Q-yZvW-CUphz1CKEIZmvp0wBC1EPkhKn21Fm69xDAYsHm5lLODtrNAMABY-f95LY3x5GJKo6d5TkTWnPWP1OeJlqJpE_kSkQRekTgA3DmaHyoOt0YF4u3L-ewxTtMkY-RlbGXym2xIBM7pA7ALs8nAi3JMU", 
        "https://public.am.files.1drv.com/y4mK1n7NvPRtsNJadLwGCjFBz99oFseBbZEBKEvBVDcbXwv7J3UZgQO-9U8kFGC2Jev2AdawD0TJQFC7ZvI2491YKkTwxYOFSbradn9la1R1v2ztTXLby0TUexmOjlWsIFA67Vn6cp6zFTPFAWxWdS1BDDWtxVEgT8XZoNPkRT26np8SZeohpkr9Ye9PwrI7I3uLEpq6j5Z4EYWg2HaWMFApD5Hn1NgXSbHIJmStfCM-2M", 
        "https://public.am.files.1drv.com/y4mC8PiiE2iJyLnj7FtWnfgM9Khr9APAT1McpFh7tbA25CirD6dc5B--XWA_gcxbsH7Cq-s83V_dIqm8xpCVJ4eF3AyC0pqHo0IB7KB8gnC6gfWfr0WwKqEwYjogu-LTDAgpMUzq73lcCV95VIbC5bHwdD-B_cH1v_wAyoz91XhIG5YhQEx-gfBAhqSCqaV8LLGXerLQORHHRLnTI3dJPV9Pba0fS8tmxp4UPuRtptGBrI", 
        "https://public.am.files.1drv.com/y4mChuZ1uAzXTOAW1r0VjD06-1eVzwwLfCjoEDLVIfN-WmZ7oETbwpRE5f1i8gUwvqDCbV3oRohwI2btPg4txq1ZE9chAPMJV2iwm1qa8suas7z218ujF37-Jo4WllfluJpC-wXF326U0_FHZJV0ygydrh_Stka7DZbOx9C0wB1lbR56YjbMuo_ctMMBBCzDWbirOA4_x-nA9WCz10ss9uPkPrXFMI-zQ7tYlPBqveEPOg", 
        "https://public.am.files.1drv.com/y4m_pv7veso7tN49soDCcKc60B9woO0XQKNUtu6v5sxHcL4aVdkRhK6tvl8N3mFfbb7M8xhs2VjYR33PMwM3WOMm6YKaSLPp5ZOzHARG4dvykJDqT_0MflFBglUIDl9SAbCmp0ahiQVd0Mdwxt6-3ydvjK6vJgqtftqq8p8G_Jpnfzd5sqSceMuytRicrjT498UNtxQkjkEK-HlIkq2u-q8soTa3NbnwDrJN8yy8Io2WP8",
        "https://public.am.files.1drv.com/y4m01dmsTDNAgk6JNZI3AxFvtRJCGChTI-QW4k64tk4d83-6qSCB0NQb9i5Pt6j0I9Wx2XiCY4GpdnKJzhvwbyCelgwiLHQRKJMD96OQ2cVhf2KjV41Fbw7FimufDWUvnLLr69AXmKz-21DsKht_Loj-24ZP26Uqk_o654VNimTFPHQb3iByDBIuNCoMP1qeB2KeJvPzW5sJ-PMbxVanLIVQdzgLTGM0hSL4tzyrZ9QW0Y",
        "https://public.am.files.1drv.com/y4meNfTdXCyt8YF3EPD_FW7v5LIpASIvTskYVhXxE9c3uTaonRV4hOCoM3_idKBq8QwM3E0vdbrZc9zPqLCqS0jdwUs7TjSaGPF_dfkLBq9dEOhkIbF5t0_lD8KcoKmGu2ntOEW-LgK83UvctstTqMBjICMnYwI4nMo-yQXY6qsFhM9fLoRpnMNIy-zz81faiKd0YcnmyU2Uerb_ZBXFpD4-SkE49Y0V1-RTQuZyiSq3Gs")

#setting parameter variables
counter<-1
europe <- data.frame(date=as.Date(character()),
                     avg_price=numeric(), 
                     city=character(), 
                     stringsAsFactors=FALSE) 

#loading Europe dataframe
for (town in urls){
  town<-grabremote(urls[counter])
  town<-cleaning(town) %>% 
    mutate(city = cities[counter])
  europe<-rbind(europe,town)
  print(paste("cleaned and downloaded", cities[counter]))
  counter<-counter+1
}

head(europe)


#cleaning up outputs
write.csv(europe, "gen/temp/europe_prices.csv", row.names = FALSE)
print("All European AirBNB data downloaded and cleaned")
