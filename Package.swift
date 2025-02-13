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
                    url: "https://github.com/mozi-app/sentry-cocoa/releases/download/v8.45.0/Sentry.xcframework.zip",
                    checksum: "52c758be06bf0c4fd19379aa570a1729432739a1c83676007eefe84a31a7a298" //Sentry-Static
                ),
        .binaryTarget(
                    name: "Sentry-Dynamic",
                    url: "https://github.com/mozi-app/sentry-cocoa/releases/download/v8.45.0/Sentry-Dynamic.xcframework.zip",
                    checksum: "19150ed5311ff356a6f2a2a8025659bf0bf74dc02c77168dcd871e0a414e3715" //Sentry-Dynamic
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
