context("Updating dates")

test_that("update.Date returns a date object", {
  date <- as.Date("05/05/2010", "%m/%d/%Y")
  expect_that(update(date, days = 1), is_a("Date"))
  expect_that(update(date, ydays = 1), is_a("Date"))
  expect_that(update(date, mdays = 1), is_a("Date"))
  expect_that(update(date, wdays = 1), is_a("Date"))
  expect_that(update(date, months = 1), is_a("Date"))
  expect_that(update(date, years = 2001), is_a("Date"))
  expect_that(update(date, tzs = "UTC"), is_a("Date"))
})

test_that("update.Date returns a posix object if time is manipulated", {
  date <- as.Date("05/05/2010", "%m/%d/%Y")
  expect_that(update(date, seconds = 1), is_a("POSIXt"))
  expect_that(update(date, minutes = 1), is_a("POSIXt"))
  expect_that(update(date, hours = 1), is_a("POSIXt"))
})

test_that("update.POSIXlt returns a POSIXlt object", {
  poslt <- as.POSIXlt("2010-02-03 13:45:59", tz = "GMT", format = "%Y-%m-%d %H:%M:%S")
  expect_that(update(poslt, seconds = 1), is_a("POSIXlt"))
  expect_that(update(poslt, minutes = 1), is_a("POSIXlt"))
  expect_that(update(poslt, hours = 1), is_a("POSIXlt"))
  expect_that(update(poslt, days = 1), is_a("POSIXlt"))
  expect_that(update(poslt, ydays = 1), is_a("POSIXlt"))
  expect_that(update(poslt, mdays = 1), is_a("POSIXlt"))
  expect_that(update(poslt, wdays = 1), is_a("POSIXlt"))
  expect_that(update(poslt, months = 1), is_a("POSIXlt"))
  expect_that(update(poslt, years = 2001), is_a("POSIXlt"))
  expect_that(update(poslt, tzs = "UTC"), is_a("POSIXlt"))
})

test_that("update.POSIXct returns a POSIXct object", {
  posct <- as.POSIXct("2010-02-03 13:45:59", tz = "GMT", format
     = "%Y-%m-%d %H:%M:%S")
  expect_that(update(posct, seconds = 1), is_a("POSIXct"))
  expect_that(update(posct, minutes = 1), is_a("POSIXct"))
  expect_that(update(posct, hours = 1), is_a("POSIXct"))
  expect_that(update(posct, days = 1), is_a("POSIXct"))
  expect_that(update(posct, ydays = 1), is_a("POSIXct"))
  expect_that(update(posct, mdays = 1), is_a("POSIXct"))
  expect_that(update(posct, wdays = 1), is_a("POSIXct"))
  expect_that(update(posct, months = 1), is_a("POSIXct"))
  expect_that(update(posct, years = 2001), is_a("POSIXct"))
  expect_that(update(posct, tzs = "UTC"), is_a("POSIXct"))
})

test_that("update.Date performs simple operation as expected", {
  date <- as.Date("05/05/2010", "%m/%d/%Y")
  expect_that(second(update(date, seconds = 1)), equals(1))
  expect_that(minute(update(date, minutes = 1)), equals(1))
  expect_that(hour(update(date, hours = 1)), equals(1))
  expect_that(mday(update(date, mdays = 1)), equals(1))
  expect_that(wday(update(date, mdays = 1)), equals(7))
  expect_that(yday(update(date, mdays = 1)), equals(121))
  expect_that(yday(update(date, ydays = 1)), equals(1))
  expect_that(mday(update(date, ydays = 1)), equals(1))
  expect_that(wday(update(date, ydays = 1)), equals(6))
  expect_that(wday(update(date, wdays = 1)), equals(1))
  expect_that(yday(update(date, wdays = 1)), equals(122))
  expect_that(mday(update(date, wdays = 1)), equals(2))
  expect_that(month(update(date, months = 1)), equals(1))
  expect_that(year(update(date, years = 2000)), equals(2000))
  expect_match(tz(update(date, tzs = "UTC")), "UTC")
})

test_that("update.POSIXt performs simple operation as expected", {
  poslt <- as.POSIXlt("2010-02-03 13:45:59", tz = "GMT", format = "%Y-%m-%d %H:%M:%S")
  posct <- as.POSIXct("2010-02-03 13:45:59", tz = "GMT", format = "%Y-%m-%d %H:%M:%S")
  expect_that(second(update(poslt, seconds = 1)), equals(1))
  expect_that(minute(update(poslt, minutes = 1)), equals(1))
  expect_that(hour(update(poslt, hours = 1)), equals(1))
  expect_that(mday(update(poslt, mdays = 1)), equals(1))
  expect_that(wday(update(poslt, mdays = 1)), equals(2))
  expect_that(yday(update(poslt, mdays = 1)), equals(32))
  expect_that(yday(update(poslt, ydays = 1)), equals(1))
  expect_that(mday(update(poslt, ydays = 1)), equals(1))
  expect_that(wday(update(poslt, ydays = 1)), equals(6))
  expect_that(wday(update(poslt, wdays = 1)), equals(1))
  expect_that(yday(update(poslt, wdays = 1)), equals(31))
  expect_that(mday(update(poslt, wdays = 1)), equals(31))
  expect_that(month(update(poslt, months = 1)), equals(1))
  expect_that(year(update(poslt, years = 2000)), equals(2000))
  expect_match(tz(update(poslt, tzs = "UTC")), "UTC")
  expect_that(second(update(posct, seconds = 1)), equals(1))
  expect_that(minute(update(posct, minutes = 1)), equals(1))
  expect_that(hour(update(posct, hours = 1)), equals(1))
  expect_that(mday(update(posct, mdays = 1)), equals(1))
  expect_that(wday(update(posct, mdays = 1)), equals(2))
  expect_that(yday(update(posct, mdays = 1)), equals(32))
  expect_that(yday(update(posct, ydays = 1)), equals(1))
  expect_that(mday(update(posct, ydays = 1)), equals(1))
  expect_that(wday(update(posct, ydays = 1)), equals(6))
  expect_that(wday(update(posct, wdays = 1)), equals(1))
  expect_that(yday(update(posct, wdays = 1)), equals(31))
  expect_that(mday(update(posct, wdays = 1)), equals(31))
  expect_that(month(update(posct, months = 1)), equals(1))
  expect_that(year(update(posct, years = 2000)), equals(2000))
  expect_match(tz(update(posct, tzs = "UTC")), "UTC")
})

test_that("update.POSIXt works on wdays", {

  date <- ymd("2017-05-07") ## sunday
  ct <- as.POSIXct("2010-02-03 13:45:59", tz = "America/New_York", format = "%Y-%m-%d %H:%M:%S") ## Wednesday
  expect_equal(wday(update(ct, wdays = 1)), 1)
  expect_equal(wday(update(ct, wdays = 2)), 2)
  expect_equal(wday(update(ct, wdays = 5)), 5)
  expect_equal(wday(update(ct, wdays = 7)), 7)
  expect_equal(wday(update(date, wdays = 1)), 1)
  expect_equal(wday(update(date, wdays = 2)), 2)
  expect_equal(wday(update(date, wdays = 5)), 5)
  expect_equal(wday(update(date, wdays = 7)), 7)

  ws <- 1
  expect_equal(wday(update(ct, wdays = 1, week_start = ws)), 2)
  expect_equal(wday(update(ct, wdays = 2, week_start = ws)), 3)
  expect_equal(wday(update(ct, wdays = 5, week_start = ws)), 6)
  expect_equal(wday(update(ct, wdays = 7, week_start = ws)), 1)
  expect_equal(wday(update(date, wdays = 1, week_start = ws)), 2)
  expect_equal(wday(update(date, wdays = 2, week_start = ws)), 3)
  expect_equal(wday(update(date, wdays = 5, week_start = ws)), 6)
  expect_equal(wday(update(date, wdays = 7, week_start = ws)), 1)

  ws <- 1
  expect_equal(wday(update(ct, wdays = 1, week_start = ws), week_start = ws), 1)
  expect_equal(wday(update(ct, wdays = 2, week_start = ws), week_start = ws), 2)
  expect_equal(wday(update(ct, wdays = 5, week_start = ws), week_start = ws), 5)
  expect_equal(wday(update(ct, wdays = 7, week_start = ws), week_start = ws), 7)
  expect_equal(wday(update(date, wdays = 1, week_start = ws), week_start = ws), 1)
  expect_equal(wday(update(date, wdays = 2, week_start = ws), week_start = ws), 2)
  expect_equal(wday(update(date, wdays = 5, week_start = ws), week_start = ws), 5)
  expect_equal(wday(update(date, wdays = 7, week_start = ws), week_start = ws), 7)

  ws <- 3
  expect_equal(wday(update(ct, wdays = 1, week_start = ws), week_start = ws), 1)
  expect_equal(wday(update(ct, wdays = 2, week_start = ws), week_start = ws), 2)
  expect_equal(wday(update(ct, wdays = 5, week_start = ws), week_start = ws), 5)
  expect_equal(wday(update(ct, wdays = 7, week_start = ws), week_start = ws), 7)
  expect_equal(wday(update(date, wdays = 1, week_start = ws), week_start = ws), 1)
  expect_equal(wday(update(date, wdays = 2, week_start = ws), week_start = ws), 2)
  expect_equal(wday(update(date, wdays = 5, week_start = ws), week_start = ws), 5)
  expect_equal(wday(update(date, wdays = 7, week_start = ws), week_start = ws), 7)

})

test_that("updates on ydays works correctly with leap years", {
  expect_equal(update(ymd("15-02-03", tz = "UTC"), years = 2000, ydays = 1),
               ymd("2000-01-01", tz = "UTC"))
  expect_equal(update(ymd("15-02-03", tz = "UTC"), years = 2015, ydays = 1),
               ymd("2015-01-01", tz = "UTC"))
  expect_equal(update(ymd("15-02-03", tz = "UTC"), years = 2016, ydays = 10),
               ymd("2016-01-10", tz = "UTC"))
  expect_equal(update(ymd("15-02-03", tz = "America/New_York"), years = 2000, ydays = 1),
               ymd("2000-01-01", tz = "America/New_York"))
  expect_equal(update(ymd("15-02-03", tz = "America/New_York"), years = 2015, ydays = 1),
               ymd("2015-01-01", tz = "America/New_York"))
  expect_equal(update(ymd("15-02-03", tz = "America/New_York"), years = 2016, ydays = 10),
               ymd("2016-01-10", tz = "America/New_York"))

  expect_equal(update(ymd(c("2016-02-29", "2016-03-01")), ydays = 1),
               ymd(c("2016-01-01", "2016-01-01")))
  expect_equal(update(ymd(c("2016-02-29", "2016-03-01"), tz = "America/New_York"), ydays = 1),
               ymd(c("2016-01-01", "2016-01-01"), tz = "America/New_York"))
  expect_equal(update(ymd_hms(c("2016-02-29 1:2:3", "2016-03-01 10:20:30")), ydays = 1),
               ymd_hms(c("2016-01-01 1:2:3", "2016-01-01 10:20:30")))
  expect_equal(update(ymd_hms(c("2016-02-29 1:2:3", "2016-03-01 10:20:30"), tz = "America/New_York"), ydays = 1),
               ymd_hms(c("2016-01-01 1:2:3", "2016-01-01 10:20:30"), tz = "America/New_York"))

})


test_that("update performs roll overs correctly for Date objects", {
  date <- as.Date("05/05/2010", "%m/%d/%Y")
  expect_that(second(update(date, seconds = 61)), equals(1))
  expect_that(minute(update(date, seconds = 61)), equals(1))
  expect_that(minute(update(date, minutes = 61)), equals(1))
  expect_that(hour(update(date, minutes = 61)), equals(1))
  expect_that(hour(update(date, hours = 25)), equals(1))
  expect_that(mday(update(date, hours = 25)), equals(6))
  expect_that(yday(update(date, hours = 25)), equals(126))
  expect_that(wday(update(date, hours = 25)), equals(5))
  expect_that(mday(update(date, mdays = 32)), equals(1))
  expect_that(month(update(date, mdays = 32)), equals(6))
  expect_that(wday(update(date, wdays = 31)), equals(3))
  expect_that(month(update(date, wdays = 31)), equals(6))
  expect_that(yday(update(date, ydays = 366)), equals(1))
  expect_that(month(update(date, ydays = 366)), equals(1))
  expect_that(month(update(date, months = 13)), equals(1))
  expect_that(year(update(date, months = 13)), equals(2011))
  expect_match(tz(update(date, months = 13)), "UTC")
})

test_that("update performs roll overs correctly for POSIXlt objects", {
  poslt <- as.POSIXlt("2010-05-05 00:00:00", tz = "GMT", format = "%Y-%m-%d %H:%M:%S")
  expect_that(second(update(poslt, seconds = 61)), equals(1))
  expect_that(minute(update(poslt, seconds = 61)), equals(1))
  expect_that(minute(update(poslt, minutes = 61)), equals(1))
  expect_that(hour(update(poslt, minutes = 61)), equals(1))
  expect_that(hour(update(poslt, hours = 25)), equals(1))
  expect_that(mday(update(poslt, hours = 25)), equals(6))
  expect_that(yday(update(poslt, hours = 25)), equals(126))
  expect_that(wday(update(poslt, hours = 25)), equals(5))
  expect_that(mday(update(poslt, mdays = 32)), equals(1))
  expect_that(month(update(poslt, mdays = 32)), equals(6))
  expect_that(wday(update(poslt, wdays = 31)), equals(3))
  expect_that(month(update(poslt, wdays = 31)), equals(6))
  expect_that(yday(update(poslt, ydays = 366)), equals(1))
  expect_that(month(update(poslt, ydays = 366)), equals(1))
  expect_that(month(update(poslt, months = 13)), equals(1))
  expect_that(year(update(poslt, months = 13)), equals(2011))
  expect_match(tz(update(poslt, months = 13)), "GMT")
})

test_that("update performs roll overs correctly for POSIXct objects", {
  posct <- as.POSIXct("2010-05-05 00:00:00", tz = "GMT", format = "%Y-%m-%d %H:%M:%S")
  expect_that(second(update(posct, seconds = 61)), equals(1))
  expect_that(minute(update(posct, seconds = 61)), equals(1))
  expect_that(minute(update(posct, minutes = 61)), equals(1))
  expect_that(hour(update(posct, minutes = 61)), equals(1))
  expect_that(hour(update(posct, hours = 25)), equals(1))
  expect_that(mday(update(posct, hours = 25)), equals(6))
  expect_that(yday(update(posct, hours = 25)), equals(126))
  expect_that(wday(update(posct, hours = 25)), equals(5))
  expect_that(mday(update(posct, mdays = 32)), equals(1))
  expect_that(month(update(posct, mdays = 32)), equals(6))
  expect_that(wday(update(posct, wdays = 31)), equals(3))
  expect_that(month(update(posct, wdays = 31)), equals(6))
  expect_that(yday(update(posct, ydays = 366)), equals(1))
  expect_that(month(update(posct, ydays = 366)), equals(1))
  expect_that(month(update(posct, months = 13)), equals(1))
  expect_that(year(update(posct, months = 13)), equals(2011))
  expect_match(tz(update(posct, months = 13)), "GMT")
})

test_that("update performs consecutive roll overs correctly for
  Date objects regardless of order", {
  date <- update(as.Date("11/01/2010", "%m/%d/%Y"),
    months = 13, days = 32, hours = 25, minutes = 61, seconds
     = 61)
  expect_that(second(date), equals(1))
  expect_that(minute(date), equals(2))
  expect_that(hour(date), equals(2))
  expect_that(mday(date), equals(2))
  expect_that(wday(date), equals(4))
  expect_that(yday(date), equals(33))
  expect_that(month(date), equals(2))
  expect_that(year(date), equals(2011))
  expect_match(tz(date), "UTC")
  date2 <- update(as.Date("11/01/2010", "%m/%d/%Y"),
    seconds = 61, minutes = 61, hours = 25, days = 32, months = 13)
  expect_that(second(date2), equals(1))
  expect_that(minute(date2), equals(2))
  expect_that(hour(date2), equals(2))
  expect_that(mday(date2), equals(2))
  expect_that(wday(date2), equals(4))
  expect_that(yday(date2), equals(33))
  expect_that(month(date2), equals(2))
  expect_that(year(date2), equals(2011))
  expect_match(tz(date2), "UTC")
})

test_that("update performs consecutive roll overs correctly for
  POSIXlt objects", {
  posl <- as.POSIXlt("2010-11-01 00:00:00", tz = "GMT", format
     = "%Y-%m-%d %H:%M:%S")
  poslt <- update(posl, months = 13, days = 32, hours = 25,
    minutes = 61, seconds = 61)

  expect_that(second(poslt), equals(1))
  expect_that(minute(poslt), equals(2))
  expect_that(hour(poslt), equals(2))
  expect_that(mday(poslt), equals(2))
  expect_that(wday(poslt), equals(4))
  expect_that(yday(poslt), equals(33))
  expect_that(month(poslt), equals(2))
  expect_that(year(poslt), equals(2011))
  expect_match(tz(poslt), "GMT")

  poslt2 <- update(posl, seconds = 61, minutes = 61, hours = 25,
    days = 32, months = 13)

  expect_that(second(poslt2), equals(1))
  expect_that(minute(poslt2), equals(2))
  expect_that(hour(poslt2), equals(2))
  expect_that(mday(poslt2), equals(2))
  expect_that(wday(poslt2), equals(4))
  expect_that(yday(poslt2), equals(33))
  expect_that(month(poslt2), equals(2))
  expect_that(year(poslt2), equals(2011))
  expect_match(tz(poslt2), "GMT")
})

test_that("update performs consecutive roll overs correctly for POSIXct objects", {
  posc <- as.POSIXct("2010-11-01 00:00:00", tz = "GMT", format
     = "%Y-%m-%d %H:%M:%S")
  posct <- update(posc, months = 13, days = 32, hours = 25,
    minutes = 61, seconds = 61)

  expect_that(second(posct), equals(1))
  expect_that(minute(posct), equals(2))
  expect_that(hour(posct), equals(2))
  expect_that(mday(posct), equals(2))
  expect_that(wday(posct), equals(4))
  expect_that(yday(posct), equals(33))
  expect_that(month(posct), equals(2))
  expect_that(year(posct), equals(2011))
  expect_match(tz(posct), "GMT")

  posct2 <- update(posc, seconds = 61, minutes = 61, hours = 25,
    days = 32, months = 13)

  expect_that(second(posct2), equals(1))
  expect_that(minute(posct2), equals(2))
  expect_that(hour(posct2), equals(2))
  expect_that(mday(posct2), equals(2))
  expect_that(wday(posct2), equals(4))
  expect_that(yday(posct2), equals(33))
  expect_that(month(posct2), equals(2))
  expect_that(year(posct2), equals(2011))
  expect_match(tz(posct2), "GMT")
})

test_that("update returns NA for date-times in the spring dst gap", {
  poslt <- as.POSIXlt("2010-03-14 01:59:59", tz = "UTC", format = "%Y-%m-%d %H:%M:%S")
  poslt <- force_tz(poslt, tzone = "America/New_York")
  expect_true(is.na(update(poslt, seconds = 65)))
  expect_true(is.na(update(poslt, minutes = 65)))
  expect_true(is.na(update(poslt, hours = 2)))
  poslt <- as.POSIXlt("2010-03-13 02:59:59", tz = "UTC", format = "%Y-%m-%d %H:%M:%S")
  poslt <- force_tz(poslt, tzone = "America/New_York")
  expect_true(is.na(update(poslt, mdays = 14)))
  expect_true(is.na(update(poslt, wdays = 8)))
  expect_true(is.na(update(poslt, ydays = 73)))
  poslt <- as.POSIXlt("2010-02-14 02:59:59", tz = "UTC", format = "%Y-%m-%d %H:%M:%S")
  poslt <- force_tz(poslt, tzone = "America/New_York")
  expect_true(is.na(update(poslt, months = 3)))
  poslt <- as.POSIXlt("2009-03-14 02:59:59", tz = "UTC", format = "%Y-%m-%d %H:%M:%S")
  poslt <- force_tz(poslt, tzone = "America/New_York")
  expect_true(is.na(update(poslt, years = 2010)))
  poslt <- as.POSIXlt("2010-03-14 02:59:59", tz = "UTC", format = "%Y-%m-%d %H:%M:%S")
  expect_true(is.na(update(poslt, tzs = "America/New_York")))
})

test_that("update handles vectors of dates", {
  poslt <- as.POSIXlt(c("2010-02-14 01:59:59", "2010-02-15 01:59:59", "2010-02-16 01:59:59"),
                      tz = "UTC", format = "%Y-%m-%d %H:%M:%S")
  posct <- as.POSIXct(poslt)
  date <- as.Date(poslt)
  expect_that(second(update(poslt, seconds = 1)), equals(c(1, 1, 1)))
  expect_that(second(update(posct, seconds = 1)), equals(c(1, 1, 1)))
  expect_that(day(update(date, days = 1)), equals(c(1, 1, 1)))
})

test_that("update handles vectors of dates and conformable vector of inputs", {
  poslt <- as.POSIXlt(c("2010-02-14 01:59:59", "2010-02-15 01:59:59", "2010-02-16
    01:59:59"), tz = "UTC", format = "%Y-%m-%d %H:%M:%S")
  posct <- as.POSIXct(poslt)
  date <- as.Date(poslt)
  expect_that(second(update(poslt, seconds = c(1, 2, 3))), equals(c(1, 2, 3)))
  expect_that(second(update(posct, seconds = c(1, 2, 3))), equals(c(1, 2, 3)))
  expect_that(day(update(date, days = c(1, 2, 3))), equals(c(1, 2, 3)))
})

test_that("update handles single vector of inputs", {
  poslt <- as.POSIXlt("2010-03-14 01:59:59", tz = "UTC", format = "%Y-%m-%d %H:%M:%S")
  posct <- as.POSIXct(poslt)
  date <- as.Date(poslt)
  expect_that(second(update(poslt, seconds = c(1, 2, 3))), equals(c(1, 2, 3)))
  expect_that(second(update(posct, seconds = c(1, 2, 3))), equals(c(1, 2, 3)))
  expect_that(day(update(date, days = c(1, 2, 3))), equals(c(1, 2, 3)))
})

test_that("update handles conformable vectors of inputs", {
  poslt <- as.POSIXlt("2010-03-10 01:59:59", tz = "UTC", format = "%Y-%m-%d %H:%M:%S")
  posct <- as.POSIXct(poslt)
  date <- as.Date(poslt)
  expect_that(second(update(poslt, seconds = c(1, 2), minutes = c(1, 2, 3, 4))), equals(c(1, 2, 1, 2)))
  expect_that(second(update(posct, seconds = c(1, 2), minutes = c(1, 2, 3, 4))), equals(c(1, 2, 1, 2)))
  expect_that(day(update(date, days = c(1, 2), months = c(1, 2, 3, 4))), equals(c(1, 2, 1, 2)))
})

test_that("update.POSIXct returns input of length zero when given input of length zero", {
  x <- structure(vector(mode = "numeric"), class = c("POSIXct", "POSIXt"))
  expect_equal(update(x, days = 1), x)
})

test_that("update.POSIXlt returns input of length zero when given input of length zero", {
  x <- as.POSIXlt(structure(vector(mode = "numeric"), class = c("POSIXct", "POSIXt")))
  expect_equal(update(x, days = 1), x)
})

test_that("update correctly handles 60 seconds on 59 minute (bug #313)", {
  expect_equal(ymd_hms("2015-01-01 00:59:00") + seconds(60),
               ymd_hms("2015-01-01 01:00:00"))
  expect_equal(ymd_hms("2015-01-01 01:59:00") + seconds(60),
               ymd_hms("2015-01-01 02:00:00"))
  expect_equal(ymd_hms("2015-01-01 23:59:00") + seconds(60),
               ymd_hms("2015-01-02 00:00:00"))
  expect_equal(ymd_hms("2015-01-01 00:59:05") + seconds(55),
               ymd_hms("2015-01-01 01:00:00"))
  expect_equal(ymd_hms("2015-01-01 00:59:59") + seconds(1),
               ymd_hms("2015-01-01 01:00:00"))
})

test_that("Updateing on seconds doesn't affect hours", {
  ## https://github.com/tidyverse/lubridate/issues/619
  tt <- now()
  tt2 <- tt
  second(tt2) <- 5
  expect_equal(hour(tt), hour(tt2))
})


## ## bug #319
## x <- structure(list(sec = 0, min = 0, hour = 0, mday = -212, mon = 7L,
##                         year = 108L, wday = NA_integer_, yday = NA_integer_, isdst = 0L,
##                         zone = "EST", gmtoff = -18000L),
##                    .Names = c("sec", "min",
##                        "hour", "mday", "mon", "year", "wday", "yday", "isdst", "zone",
##                        "gmtoff"),
##                    tzone = c("America/New_York", "EST", "EDT"),
##                    class = c("POSIXlt", "POSIXt"))
## update(x, year = year(x) + 1)
