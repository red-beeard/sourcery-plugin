// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "SourceryPlugins",
	products: [
		.plugin(name: "SourceryCommand", targets: ["SourceryCommand"])
	],
	targets: [
		.plugin(
			name: "SourceryCommand",
			capability: .buildTool(),
			dependencies: ["Sourcery"]
		),
		.binaryTarget(
			name: "Sourcery",
			path: "Sourcery.artifactbundle"
		)
	]
)
