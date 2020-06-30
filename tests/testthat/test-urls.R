test_that("sysreqs_base_url", {
  expect_identical(sysreqs_base_url(), "https://sysreqs.r-hub.io")
  expect_identical(
    sysreqs_url(),
    "https://sysreqs.r-hub.io/map-platform/:platform/:query"
  )
  expect_identical(
    sysreqs_cran_url(),
    "https://sysreqs.r-hub.io/pkg/:package/:platform"
  )
  expect_identical(
    sysreqs_platform_url(),
    "https://sysreqs.r-hub.io/platform/get/:platform"
  )

  withr::with_envvar(
    list("SYSREQS_URL" = "https://new-sysreqs.host.com"), {
      expect_identical(sysreqs_base_url(), "https://new-sysreqs.host.com")
      expect_identical(
        sysreqs_url(),
        "https://new-sysreqs.host.com/map-platform/:platform/:query"
      )
      expect_identical(
        sysreqs_cran_url(),
        "https://new-sysreqs.host.com/pkg/:package/:platform"
      )
      expect_identical(
        sysreqs_platform_url(),
        "https://new-sysreqs.host.com/platform/get/:platform"
      )
    }
  )
})
