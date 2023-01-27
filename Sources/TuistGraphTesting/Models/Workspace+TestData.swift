import Foundation
import TSCBasic
import TSCUtility
@testable import TuistGraph

extension Workspace {
    public static func test(
        path: AbsolutePath = AbsolutePath("/"),
        xcWorkspacePath: AbsolutePath = AbsolutePath("/"),
        name: String = "test",
        projects: [AbsolutePath] = [],
        schemes: [Scheme] = [],
        ideTemplateMacros: IDETemplateMacros? = nil,
        additionalFiles: [FileElement] = [],
        generationOptions: GenerationOptions = .test()
    ) -> Workspace {
        Workspace(
            path: path,
            xcWorkspacePath: xcWorkspacePath,
            name: name,
            projects: projects,
            schemes: schemes,
            generationOptions: generationOptions,
            ideTemplateMacros: ideTemplateMacros,
            additionalFiles: additionalFiles
        )
    }
}

extension Workspace.GenerationOptions {
    public static func test(
        enableAutomaticXcodeSchemes: Bool? = false,
        autogeneratedWorkspaceSchemes: AutogeneratedWorkspaceSchemes = .enabled(
            codeCoverageMode: .disabled,
            testingOptions: [],
            testLanguage: nil,
            testRegion: nil
        ),
        lastXcodeUpgradeCheck: Version? = nil
    ) -> Self {
        .init(
            enableAutomaticXcodeSchemes: enableAutomaticXcodeSchemes,
            autogeneratedWorkspaceSchemes: autogeneratedWorkspaceSchemes,
            lastXcodeUpgradeCheck: lastXcodeUpgradeCheck,
            renderMarkdownReadme: false
        )
    }
}
