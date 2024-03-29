test_that("simple denominator", {
  expect_equal(nom_denom(1), "whole")
  expect_equal(nom_denom(2), "half")
  expect_equal(nom_denom(3), "third")
  expect_equal(nom_denom(12), "twelfth")
  expect_equal(nom_denom(21), "twenty-first")
  expect_equal(nom_denom(100000000), "hundred-millionth")
})

test_that("plural denominator", {
  expect_equal(nom_denom(1, 2), "wholes")
  expect_equal(nom_denom(2, 2), "halves")
  expect_equal(nom_denom(3, 2), "thirds")
  expect_equal(nom_denom(12, 2), "twelfths")
  expect_equal(nom_denom(21, 2), "twenty-firsts")
  expect_equal(nom_denom(100000000, 2), "hundred-millionths")
})

test_that("denominator vector", {
  expect_equal(
    nom_denom(c(1, 2, 100000000)), c("whole", "half", "hundred-millionth")
  )
  expect_equal(
    nom_denom(c(1, 2, 100000000), 1:3),
    c("whole", "halves", "hundred-millionths")
  )
})

test_that("quarter", {
  expect_equal(nom_denom(4), "quarter")
  expect_equal(nom_denom(4, quarter = FALSE), "fourth")
})

test_that("denominator with cardinal = FALSE", {
  expect_equal(
    nom_denom(1:3, 2, cardinal = FALSE), c("wholes", "halves", "3rds")
  )
})

test_that("denominator with max_n", {
  expect_equal(nom_denom(3, 2, max_n = 10), "thirds")
  expect_equal(nom_denom(20, 2, max_n = 10), "20ths")
  expect_equal(nom_denom(c(3, 20), 2, max_n = 10), c("thirds", "20ths"))
  expect_equal(
    nom_denom(c(20, 20), 2, max_n = c(10, 100)), c("20ths", "twentieths")
  )
})

test_that("non-finite", {
  expect_equal(
    nom_denom(c(NA, 2, Inf, NaN, NA)),
    c(NA, "half", "infinitieth", NaN, NA)
  )
})

test_that("early return", {
  expect_equal(nom_denom(NA), NA_character_)
  expect_equal(nom_denom(numeric(0)), character(0))
})

test_that("errors", {
  expect_error(nom_denom(character(1)))
  expect_error(nom_denom(numeric(1), negative = numeric(1)))
  expect_error(nom_denom(numeric(1), negative = character(0)))
  expect_error(nom_denom(numeric(1), negative = character(2)))
  expect_error(nom_denom(numeric(1), numerator = character(1)))
  expect_error(nom_denom(numeric(2), numerator = numeric(3)))
  expect_error(nom_denom(numeric(2), negative = numeric(3)))
  expect_error(nom_denom(numeric(2), quarter = numeric(1)))
  expect_error(nom_denom(numeric(2), quarter = NA))
  expect_error(nom_denom(numeric(2), quarter = logical(2)))
})
