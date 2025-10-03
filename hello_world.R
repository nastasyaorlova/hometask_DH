library(tidyverse)

url <- "https://dataverse.pushdom.ru/dataset.xhtml?persistentId=doi:10.31860/openlit-2019.11-C003"
download.file(url, destfile = "elegies.tab")

pesni_tbl <- read_tsv("elegies.tab")

elegies_df <- as.data.frame(elegies_tbl)

elegies_tbl |> 
  count(Year) 
# |> 
#   print()

elegies_tbl |> 
  filter(Year == 1824) |> # используем логический оператор для выбора
  count(Author) |>  #  можно задать  аргумент sort = TRUE
  arrange(-n)  |>   # не нужно, если sort = TRUE
  print()


url = "https://dataverse.pushdom.ru/api/access/datafile/:persistentId?persistentId=doi:10.31860/openlit-2019.11-C003/UNYYWF"
download.file(url, "rus_songs_corpus.zip")
# trying URL 'https://dataverse.pushdom.ru/api/access/datafile/:persistentId?persistentId=doi:10.31860/openlit-2019.11-C001/SKGO9Q'
# Content type 'application/zip; name="elegies_corpus.zip";charset=UTF-8' length 806772 bytes (787 KB)
# ==================================================
# downloaded 787 KB


unzip("rus_songs_corpus.zip")

elegies_files <- list.files("rus_songs_corpus", full.names = TRUE)

head(elegies_files)

head(elegies_files)