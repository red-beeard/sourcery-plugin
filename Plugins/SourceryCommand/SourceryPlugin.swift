import PackagePlugin
import Foundation

@main
struct SourceryCommand: BuildToolPlugin {
	func createBuildCommands(context: PackagePlugin.PluginContext, target: PackagePlugin.Target) async throws -> [PackagePlugin.Command] {
		let dir = context.pluginWorkDirectory.appending("sourcery")
		try? FileManager.default.removeItem(atPath: dir.string)
		try FileManager.default.createDirectory(atPath: dir.string, withIntermediateDirectories: false)
		
		let sourceryExecutable = try context.tool(named: "sourcery")
		
		return [
			.prebuildCommand(
				displayName: "SourceryCommand",
				executable: sourceryExecutable.path,
				arguments: ["--disableCache"],
				outputFilesDirectory: dir)
		]
	}
}
