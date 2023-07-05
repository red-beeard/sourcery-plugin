import PackagePlugin
import Foundation

@main
struct MySwiftLintPlugin: BuildToolPlugin {
	func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
		let dir = context.pluginWorkDirectory.appending("Sourcery")
		try? FileManager.default.removeItem(atPath: dir.string)
		try FileManager.default.createDirectory(atPath: dir.string, withIntermediateDirectories: false)
		
		let current = FileManager.default.currentDirectoryPath
		
		return [
			.prebuildCommand(
				displayName: "Sourcery",
				executable: .init("/usr/local/bin/sourcery"),
				arguments: [current],
				outputFilesDirectory: dir
			)
		]
	}
}
