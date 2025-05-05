// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Sentry",
    platforms: [.iOS(.v17), .macOS(.v10_13), .tvOS(.v11), .watchOS(.v4)],
    products: [
        .library(name: "Sentry", targets: ["Sentry"]),
        .library(name: "Sentry-Dynamic", targets: ["Sentry-Dynamic"]),
        .library(name: "SentrySwiftUI", targets: ["Sentry", "SentrySwiftUI"])
    ],
    targets: [
        .binaryTarget(
                    name: "Sentry",
                    url: "https://github.com/mozi-app/sentry-cocoa/releases/download/v8.50.0/Sentry.xcframework.zip",
                    checksum: "1014f5e4029f1397cf80995445277fa308060fac9c7e4cc2c1740bd9911346f5" //Sentry-Static
                ),
        .binaryTarget(
                    name: "Sentry-Dynamic",
                    url: "https://github.com/mozi-app/sentry-cocoa/releases/download/v8.50.0/Sentry-Dynamic.xcframework.zip",
                    checksum: "6a3811f2ce358ca477d58699c7749b0357a179ff6b4b21c50240ad3c6b72acf7" //Sentry-Dynamic
                ),
        .target ( name: "SentrySwiftUI",
                  dependencies: ["Sentry", "SentryInternal"],
                  path: "Sources/SentrySwiftUI",
                  exclude: ["SentryInternal/", "module.modulemap"],
                  linkerSettings: [
                     .linkedFramework("Sentry")
                  ]
                ),
        .target( name: "SentryInternal",
                 path: "Sources/SentrySwiftUI",
                 sources: [
                    "SentryInternal/"
                 ],
                 publicHeadersPath: "SentryInternal/"
               )
    ],
    cxxLanguageStandard: .cxx14
)
