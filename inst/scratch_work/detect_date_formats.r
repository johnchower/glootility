test_dates <- c('2016-10-05'
                , '2016-10-05 stuff'
                , ' 2016-10-15'
                , 'xyz'
                , '2016-01-30 12:05:33')



pattern1 <- '^[0-9]{4}-[0-9]{2}-[0-9]{2}$'
pattern2 <- '^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}$' 

grepl(pattern = pattern1, x = test_dates)
grepl(pattern = pattern2, x = test_dates)

as.Date(test_dates)

substr(test_dates, 12, 19)


