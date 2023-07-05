// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "SwiftLintPlugin",
	platforms: [ .iOS(.v14)],
	products: [
		.plugin(name: "SourceryPlugin", targets: ["SourceryPlugin"])
	],
	targets: [
		.plugin(name: "SourceryPlugin", capability: .buildTool())
	]
)
