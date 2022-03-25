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
urls<-c("https://public.am.files.1drv.com/y4mQr3uV5M67y5SLhfSi3MvWq8eSlgy6crEwWGlVooSj1dYZcNd-_BMFdfvklR2DRRycSj4fPKsG2YuLX5QsLwuXcXlzaMc4SCqR4jyLBFn8DDswdyteLSpGQ50jOY3RjKVZIupAghtLtmcnXCS9qAatWtXh3mi4-b1ue_bBk0IiIkQ9tCrOVAsziGYVwuIInLC_KKrDSN4qObk6GSJoImcSKfLYxFjL_JJSAnwfxAd4Gc", 
        "https://public.am.files.1drv.com/y4meASmBB3TVAWSkTYezrQsVe5-YdFNxE7yplDEp9DxQV4_PGf7HKIxnI9_KQbEuBvk2cRcl_LuPT1VHl_oaci3NpAPa_R5G31Wa0AEoCodUCTZfml302Kh_RqUSfywKs0UJhGImzUm7cuRNhN7fjwMwg7lUuEEtiHluVYx6xcYlzQbV5WOA_H6F5_qOQkvOuGxsQ5z88fG0F7s9Wv7ULHyt7qPLN7Vn0cFbH-w9X0GPoQ", 
        "https://public.am.files.1drv.com/y4mDDOm9LoDCdNxZEsxs3lNKRJwrahCyh0S3NQqZp5hmAAS3q5g-R0_Ge42SmXYnZgI_URzLdpUO4FkcPSHG8dCtui-_hXrI0_MmqZfxOF8y2ezra4Z_fMq9wxLJqBlgRKrxPzqJKSeGyjIzpK9ibx6KdaMoWtecsj4SeWGZFqbLXrwj6H1hrpYfz20FOK8WORCGgEPjUfOVCEM3_p-lsigS2hDLueaagQunTV0JGZ6U2I", 
        "https://public.am.files.1drv.com/y4mVVRIyPbN2D4FTcRRDMKtyswYgbNPasYyju_n2WKZv45qc3R4-a2qJlJPw2TF6PxePfK9oaHvlV0D6XxqiieifCfnN03zbnezfDXFC1AiG0FjzGVaM8xqc6YoFYVnwTkxplF43ZGaAspE3gZjuPorRa9VZ_b7jnAgUCDnoWQrD6PLV8Xz6u8FkItA1IjA2o6o54Cb3EDpggiVZbjNRkjyYM_hnDpt-3epED1CAsOpwbg", 
        "https://public.am.files.1drv.com/y4maaxB3-O243JrGaxGC_8QSsRPuB_loSPBFnxX1HddRTCQQkQTuCJkw73HFia-qeRyAl7Wc9gs0atMQ3sxOrL49-TGScF0ID4mLp5wmsssAAi0SZPyZVK07dTaniP0WuhimSRYWzhQgnlzneD5DlMhlR0Hr6MmFdnr9wIzLv4SOpHK_1Z_qcv6GU1jWjWsEZ7vnSZzkE9BDc3krK9Ks38duF6RQeChmwPFEczfb6vS2KQ", 
        "https://public.am.files.1drv.com/y4mxxbfQS6lYbpxoXrfnB0u9ZSTlBRsPmR94oOGHNtyNI8U72GX7IIHG4Ozd54oQ-8uuFYrLTzk-0swHGz3b4aucbxNHWGKGTzYinIoZ21_oCjI1owL4Sk7tqK3SKBtC4n4Mf0FLDlhGrPi_oUt7DBt-W94MoUTRmft0usQxYsEKvarPfadBLGVH7rjTQ-nGAF2FF8r_iO67LwPyfc6znmwO5MQx-JwKfE5eHEOy2p9olk", 
        "https://public.am.files.1drv.com/y4mwV2MFTw2kHMmXjizn_4xzH44L75pxx6OFZNCicVPqH7ACwiWl45YZHh2SqQ4aIl-DmKCIpC8YNzUo44grrDxiHvfanCXALoI74D19LKrsCpQx3I6rtphjcaUppB_XGquMer2y_tv4u5OuWJPbW9xhnjUSIt1wZzfidwp6QbvxuPLGcC1DEO-G25fusoJ-ROznFzRxx4l61kZEsn-wq515zgIPaB8zll38bNSE5gE_U4", 
        "https://public.am.files.1drv.com/y4mm2sZB3dKnVd8Li4bjrAbKZnRBS9yVGI-d5vsL8ZRtcT-O6FiB8J9Q3SLfWyhVr8erNLOdjvA4FRp7gE6kgfltui8JhEx39BW34-lgzs1Rw4R58qUy6twS3eoI5GmNBKby2gYAsJ2pOvHvW7UbaGl0VU_Loc-5Gf3eJFO2Hy8iPx0GltfwDfdSEPV53gRYfLegGPZMKdsXKCV4FVgb1pBSSJxP0tx7H8LskG85e9UPEA",
        "https://public.am.files.1drv.com/y4mWCHUNC93KYmi77sIxYFsFmcfdoooewUjR4IVXeUHaswz5T-axNaA_CWqVMVgFEGWB2nOvbMzBu4bEgst-KAEeiHKwrtgPVs4kHUFVruhzOFfs-nqTvNnSPD_3xpSF-DU_deaV3sA0MeUp-WrQlaj5DdgJaU95BKBDqD3W_C9Vna-WNV1dxSVNVDcCIVDE-8mZ_m07ZuuOSbSpXfSDWcJ-U8WLFhITxtM4F3EQJFYux4",
        "https://public.am.files.1drv.com/y4m7tHpIIgiQyEvYdVT51iOYvqkbOfx-zHVjrwnFKPjVRWMPeKcFKtf97suFh4xnJHtvQLtlfl5oDr6K6x7Ttfp_2h36i7kz3_q3uNgl3LMXsW1dB4H-i2inxiTPIvKOod1bgWm61Je2z4JsAAZXWqh4VxpZwUqFlfrJghqVC8EGFf7ZZXBXiuNZMXto_140TeuRswcpQ3afvPWheV-OFMoSz9p2oKAN2EB7BdxBUnwhtM")

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
