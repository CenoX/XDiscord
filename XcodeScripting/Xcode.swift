import AppKit
import ScriptingBridge

@objc public protocol SBObjectProtocol: NSObjectProtocol {
    func get() -> Any!
}

@objc public protocol SBApplicationProtocol: SBObjectProtocol {
    func activate()
    var delegate: SBApplicationDelegate! { get set }
    var isRunning: Bool { get }
}

// MARK: XcodeSaveOptions
@objc public enum XcodeSaveOptions : AEKeyword {
    case yes = 0x79657320 /* 'yes ' */
    case no = 0x6e6f2020 /* 'no  ' */
    case ask = 0x61736b20 /* 'ask ' */
}

// MARK: XcodePrintingErrorHandling
@objc public enum XcodePrintingErrorHandling : AEKeyword {
    case standard = 0x6c777374 /* 'lwst' */
    case detailed = 0x6c776474 /* 'lwdt' */
}

// MARK: XcodePwpa
@objc public enum XcodePwpa : AEKeyword {
    case executablesDirectory = 0x70777065 /* 'pwpe' */
    case frameworks = 0x70777066 /* 'pwpf' */
    case javaResources = 0x7077706a /* 'pwpj' */
    case pluginsDirectory = 0x7077706c /* 'pwpl' */
    case productsDirectory = 0x70777070 /* 'pwpp' */
    case resources = 0x70777265 /* 'pwre' */
    case rootVolume = 0x7077706e /* 'pwpn' */
    case sharedFrameworks = 0x70777366 /* 'pwsf' */
    case sharedSupport = 0x70777373 /* 'pwss' */
    case wrapper = 0x70777072 /* 'pwpr' */
}

// MARK: XcodeBmte
@objc public enum XcodeBmte : AEKeyword {
    case analyzerResult = 0x626d7461 /* 'bmta' */
    case error = 0x626d7465 /* 'bmte' */
    case none = 0x626d746e /* 'bmtn' */
    case notice = 0x626d746f /* 'bmto' */
    case warning = 0x626d7477 /* 'bmtw' */
}

// MARK: XcodeLied
@objc public enum XcodeLied : AEKeyword {
    case cr = 0x63726c65 /* 'crle' */
    case crlf = 0x63726c66 /* 'crlf' */
    case lf = 0x6c666c65 /* 'lfle' */
    case preserveExisting = 0x70656c65 /* 'pele' */
}

// MARK: XcodeFenc
@objc public enum XcodeFenc : AEKeyword {
    case iso2022Japanese = 0x69736a70 /* 'isjp' */
    case isoLatin1 = 0x696c6131 /* 'ila1' */
    case isoLatin2 = 0x696c6132 /* 'ila2' */
    case japaneseEUC = 0x6a657563 /* 'jeuc' */
    case macosRoman = 0x6d6f7372 /* 'mosr' */
    case nextstep = 0x6e657874 /* 'next' */
    case nonlossyAscii = 0x6e6c6173 /* 'nlas' */
    case shiftJisString = 0x736a6973 /* 'sjis' */
    case symbolString = 0x73796d73 /* 'syms' */
    case unicode = 0x756e6963 /* 'unic' */
    case utf8 = 0x75746638 /* 'utf8' */
    case windowsCyrillic = 0x77636f31 /* 'wco1' */
    case windowsGreek = 0x77637033 /* 'wcp3' */
    case windowsLatin1 = 0x77637032 /* 'wcp2' */
    case windowsLatin2 = 0x77637030 /* 'wcp0' */
    case windowsTurkish = 0x77637034 /* 'wcp4' */
}

// MARK: XcodeReft
@objc public enum XcodeReft : AEKeyword {
    case absolute = 0x61737274 /* 'asrt' */
    case buildProductRelative = 0x62707274 /* 'bprt' */
    case currentSDKRelative = 0x73647274 /* 'sdrt' */
    case groupRelative = 0x67727274 /* 'grrt' */
    case other = 0x6f726674 /* 'orft' */
    case projectRelative = 0x70727274 /* 'prrt' */
    case xcodeFolderRelative = 0x78727274 /* 'xrrt' */
}

// MARK: XcodeAsms
@objc public enum XcodeAsms : AEKeyword {
    case hasConflict = 0x73636373 /* 'sccs' */
    case locallyAdded = 0x736c6173 /* 'slas' */
    case locallyModified = 0x736c6d73 /* 'slms' */
    case locallyRemoved = 0x736c7273 /* 'slrs' */
    case needsMerge = 0x736e6d73 /* 'snms' */
    case needsUpdate = 0x736e6373 /* 'sncs' */
    case unknown = 0x73637573 /* 'scus' */
    case upToDate = 0x73756473 /* 'suds' */
}

// MARK: XcodeSaveableFileFormat
@objc public enum XcodeSaveableFileFormat : AEKeyword {
    case text = 0x63747874 /* 'ctxt' */
}

// MARK: XcodeXdel
@objc public enum XcodeXdel : AEKeyword {
    case cPlusPlus = 0x78646570 /* 'xdep' */
    case java = 0x7864656a /* 'xdej' */
    case objectiveC = 0x7864656f /* 'xdeo' */
}

// MARK: XcodeXdeh
@objc public enum XcodeXdeh : AEKeyword {
    case alwaysHide = 0x78646561 /* 'xdea' */
    case alwaysShow = 0x78646573 /* 'xdes' */
    case hidePerFilter = 0x78646566 /* 'xdef' */
}

// MARK: XcodeGenericMethods
@objc public protocol XcodeGenericMethods {
    @objc optional func closeSaving(_ saving: XcodeSaveOptions, savingIn: URL!) // Close a document.
    @objc optional func saveIn(_ in_: URL!, as: XcodeSaveableFileFormat) // Save a document.
    @objc optional func printPrintDialog(_ printDialog: Bool) // Print a document.
    @objc optional func delete() // Delete an object.
    @objc optional func duplicateTo(_ to: SBObject!, withProperties: [AnyHashable : Any]!) // Copy an object.
    @objc optional func moveTo(_ to: SBObject!) // Move an object to a new location.
    @objc optional func buildStaticAnalysis(_ staticAnalysis: Bool, transcript: Bool, using using_: XcodeBuildConfigurationType!) -> String // Build the indicated target or project in Xcode. If the project is asked to build, then the active target is built.
    @objc optional func cleanRemovingPrecompiledHeaders(_ removingPrecompiledHeaders: Bool, transcript: Bool, using using_: XcodeBuildConfigurationType!) -> String // Clean the indicated target or project in Xcode. If the project is asked to build, then the active target is cleaned.
    @objc optional func addTo(_ to: SBObject!) // Adds an existing object to the container specified.
    @objc optional func removeFrom(_ from: Any!) // Removes the object from the designated container without deleting it.
}

// MARK: XcodeApplication
@objc public protocol XcodeApplication: SBApplicationProtocol {
    @objc optional func documents() -> SBElementArray
    @objc optional func windows() -> SBElementArray
    @objc optional var name: String { get } // The name of the application.
    @objc optional var frontmost: Bool { get } // Is this the active application?
    @objc optional var version: String { get } // The version number of the application.
    @objc optional func `open`(_ x: Any!) -> Any // Open a document.
    @objc optional func print(_ x: Any!, printDialog: Bool) // Print a document.
    @objc optional func quitSaving(_ saving: XcodeSaveOptions) // Quit the application.
    @objc optional func exists(_ x: Any!) -> Bool // Verify that an object exists.
    @objc optional func loadDocumentationSetWithPath(_ x: String!, display: Bool) -> Bool // Load documentation set at supplied path.
    @objc optional func pathForApple_ref(_ x: String!) -> String // Return path of document containing apple_ref.
    @objc optional func urlstringForDocumentWithUUID(_ x: String!) -> String // Return URL of document identified by UUID.
    @objc optional func urlstringForDocumentWithApple_ref(_ x: String!) -> String // Return URL of document identified by apple_ref.
    @objc optional func pathForDocumentWithUUID(_ x: String!) -> String // Return path of document identified by UUID.
    @objc optional func select(_ x: Any!) // Sets the selection to the object(s).
    @objc optional func showDocumentWithApple_ref(_ x: String!) -> Bool // Show document containing supplied apple_ref in the documentation window.
    @objc optional func showDocumentWithUUID(_ x: String!) -> Bool // Show document identified by supplied UUID in the documentation window.
    @objc optional func upgradeProjectFile(_ x: URL!, as: String!) // Upgrade the given project file to the latest project file format. This will open the project if the upgrade succeeds.
    @objc optional func breakpoints() -> SBElementArray
    @objc optional func dataModelDocuments() -> SBElementArray
    @objc optional func fileBreakpoints() -> SBElementArray
    @objc optional func fileDocuments() -> SBElementArray
    @objc optional func projects() -> SBElementArray
    @objc optional func projectTemplates() -> SBElementArray
    @objc optional func sourceDocuments() -> SBElementArray
    @objc optional func symbolicBreakpoints() -> SBElementArray
    @objc optional func workspaceDocuments() -> SBElementArray
    @objc optional var activeWorkspaceDocument: XcodeWorkspaceDocument { get } // The active workspace document in Xcode.
    @objc optional func setActiveWorkspaceDocument(_ activeWorkspaceDocument: XcodeWorkspaceDocument!) // The active workspace document in Xcode.
}
extension SBApplication: XcodeApplication {}

// MARK: XcodeDocument
@objc public protocol XcodeDocument: SBObjectProtocol, XcodeGenericMethods {
    @objc optional var name: String { get } // Its name.
    @objc optional var modified: Bool { get } // Has it been modified since the last save?
    @objc optional var file: URL { get } // Its location on disk, if it has one.
    @objc optional var path: String { get } // The document's path.
    @objc optional func setPath(_ path: String!) // The document's path.
}
extension SBObject: XcodeDocument {}

// MARK: XcodeWindow
@objc public protocol XcodeWindow: SBObjectProtocol, XcodeGenericMethods {
    @objc optional var name: String { get } // The title of the window.
    @objc optional func id() -> Int // The unique identifier of the window.
    @objc optional var index: Int { get } // The index of the window, ordered front to back.
    @objc optional var bounds: NSRect { get } // The bounding rectangle of the window.
    @objc optional var closeable: Bool { get } // Does the window have a close button?
    @objc optional var miniaturizable: Bool { get } // Does the window have a minimize button?
    @objc optional var miniaturized: Bool { get } // Is the window minimized right now?
    @objc optional var resizable: Bool { get } // Can the window be resized?
    @objc optional var visible: Bool { get } // Is the window visible right now?
    @objc optional var zoomable: Bool { get } // Does the window have a zoom button?
    @objc optional var zoomed: Bool { get } // Is the window zoomed right now?
    @objc optional var document: XcodeDocument { get } // The document whose contents are displayed in the window.
    @objc optional func setIndex(_ index: Int) // The index of the window, ordered front to back.
    @objc optional func setBounds(_ bounds: NSRect) // The bounding rectangle of the window.
    @objc optional func setMiniaturized(_ miniaturized: Bool) // Is the window minimized right now?
    @objc optional func setVisible(_ visible: Bool) // Is the window visible right now?
    @objc optional func setZoomed(_ zoomed: Bool) // Is the window zoomed right now?
}
extension SBObject: XcodeWindow {}

// MARK: XcodeRichText
@objc public protocol XcodeRichText: SBObjectProtocol, XcodeGenericMethods {
    @objc optional func characters() -> SBElementArray
    @objc optional func paragraphs() -> SBElementArray
    @objc optional func words() -> SBElementArray
    @objc optional func attributeRuns() -> SBElementArray
    @objc optional func attachments() -> SBElementArray
    @objc optional var color: NSColor { get } // The color of the text's first character.
    @objc optional var font: String { get } // The name of the font of the text's first character.
    @objc optional var size: Int { get } // The size in points of the text's first character.
    @objc optional func setColor(_ color: NSColor!) // The color of the text's first character.
    @objc optional func setFont(_ font: String!) // The name of the font of the text's first character.
    @objc optional func setSize(_ size: Int) // The size in points of the text's first character.
    @objc optional func richText() -> SBElementArray
    @objc optional func insertionPoints() -> SBElementArray
}
extension SBObject: XcodeRichText {}

// MARK: XcodeCharacter
@objc public protocol XcodeCharacter: SBObjectProtocol, XcodeGenericMethods {
    @objc optional func characters() -> SBElementArray
    @objc optional func paragraphs() -> SBElementArray
    @objc optional func words() -> SBElementArray
    @objc optional func attributeRuns() -> SBElementArray
    @objc optional func attachments() -> SBElementArray
    @objc optional var color: NSColor { get } // Its color.
    @objc optional var font: String { get } // The name of its font.
    @objc optional var size: Int { get } // Its size, in points.
    @objc optional func setColor(_ color: NSColor!) // Its color.
    @objc optional func setFont(_ font: String!) // The name of its font.
    @objc optional func setSize(_ size: Int) // Its size, in points.
    @objc optional func richText() -> SBElementArray
    @objc optional func insertionPoints() -> SBElementArray
}
extension SBObject: XcodeCharacter {}

// MARK: XcodeParagraph
@objc public protocol XcodeParagraph: SBObjectProtocol, XcodeGenericMethods {
    @objc optional func characters() -> SBElementArray
    @objc optional func paragraphs() -> SBElementArray
    @objc optional func words() -> SBElementArray
    @objc optional func attributeRuns() -> SBElementArray
    @objc optional func attachments() -> SBElementArray
    @objc optional var color: NSColor { get } // The color of the paragraph's first character.
    @objc optional var font: String { get } // The name of the font of the paragraph's first character.
    @objc optional var size: Int { get } // The size in points of the paragraph's first character.
    @objc optional func setColor(_ color: NSColor!) // The color of the paragraph's first character.
    @objc optional func setFont(_ font: String!) // The name of the font of the paragraph's first character.
    @objc optional func setSize(_ size: Int) // The size in points of the paragraph's first character.
    @objc optional func richText() -> SBElementArray
    @objc optional func insertionPoints() -> SBElementArray
}
extension SBObject: XcodeParagraph {}

// MARK: XcodeWord
@objc public protocol XcodeWord: SBObjectProtocol, XcodeGenericMethods {
    @objc optional func characters() -> SBElementArray
    @objc optional func paragraphs() -> SBElementArray
    @objc optional func words() -> SBElementArray
    @objc optional func attributeRuns() -> SBElementArray
    @objc optional func attachments() -> SBElementArray
    @objc optional var color: NSColor { get } // The color of the word's first character.
    @objc optional var font: String { get } // The name of the font of the word's first character.
    @objc optional var size: Int { get } // The size in points of the word's first character.
    @objc optional func setColor(_ color: NSColor!) // The color of the word's first character.
    @objc optional func setFont(_ font: String!) // The name of the font of the word's first character.
    @objc optional func setSize(_ size: Int) // The size in points of the word's first character.
    @objc optional func richText() -> SBElementArray
    @objc optional func insertionPoints() -> SBElementArray
}
extension SBObject: XcodeWord {}

// MARK: XcodeAttributeRun
@objc public protocol XcodeAttributeRun: SBObjectProtocol, XcodeGenericMethods {
    @objc optional func characters() -> SBElementArray
    @objc optional func paragraphs() -> SBElementArray
    @objc optional func words() -> SBElementArray
    @objc optional func attributeRuns() -> SBElementArray
    @objc optional func attachments() -> SBElementArray
    @objc optional var color: NSColor { get } // Its color.
    @objc optional var font: String { get } // The name of its font.
    @objc optional var size: Int { get } // Its size, in points.
    @objc optional func setColor(_ color: NSColor!) // Its color.
    @objc optional func setFont(_ font: String!) // The name of its font.
    @objc optional func setSize(_ size: Int) // Its size, in points.
    @objc optional func richText() -> SBElementArray
    @objc optional func insertionPoints() -> SBElementArray
}
extension SBObject: XcodeAttributeRun {}

// MARK: XcodeAttachment
@objc public protocol XcodeAttachment: XcodeRichText {
    @objc optional var fileName: String { get } // The path to the embedded file.
    @objc optional func setFileName(_ fileName: String!) // The path to the embedded file.
}
extension SBObject: XcodeAttachment {}

// MARK: XcodeInputPath
@objc public protocol XcodeInputPath: SBObjectProtocol, XcodeGenericMethods {
    @objc optional var path: String { get } // The path of the input file.
    @objc optional var runScriptPhase: XcodeRunScriptPhase { get } // The run script phase that contains this input path.
    @objc optional func setPath(_ path: String!) // The path of the input file.
}
extension SBObject: XcodeInputPath {}

// MARK: XcodeOutputPath
@objc public protocol XcodeOutputPath: SBObjectProtocol, XcodeGenericMethods {
    @objc optional var path: String { get } // The path of the output file.
    @objc optional var runScriptPhase: XcodeRunScriptPhase { get } // The run script phase that contains this output path.
    @objc optional func setPath(_ path: String!) // The path of the output file.
}
extension SBObject: XcodeOutputPath {}

// MARK: XcodeBuildConfigurationType
@objc public protocol XcodeBuildConfigurationType: SBObjectProtocol, XcodeGenericMethods {
    @objc optional func id() -> String // The unique identifier for the build configuration type.
    @objc optional var name: String { get } // The name of this build configuration type.
    @objc optional func setName(_ name: String!) // The name of this build configuration type.
}
extension SBObject: XcodeBuildConfigurationType {}

// MARK: XcodeBuildMessage
@objc public protocol XcodeBuildMessage: SBObjectProtocol, XcodeGenericMethods {
    @objc optional var buildFile: XcodeBuildFile { get } // The build file that contains this build message
    @objc optional var kind: XcodeBmte { get } // Indicates the kind of build message.
    @objc optional var location: Int { get } // The line number in the file that the build message corresponds to.
    @objc optional var message: String { get } // The text of the build message.
    @objc optional var path: String { get } // The absolute path to the file that the build message is referencing.
    @objc optional func setBuildFile(_ buildFile: XcodeBuildFile!) // The build file that contains this build message
    @objc optional func setKind(_ kind: XcodeBmte) // Indicates the kind of build message.
    @objc optional func setLocation(_ location: Int) // The line number in the file that the build message corresponds to.
    @objc optional func setMessage(_ message: String!) // The text of the build message.
    @objc optional func setPath(_ path: String!) // The absolute path to the file that the build message is referencing.
}
extension SBObject: XcodeBuildMessage {}

// MARK: XcodeContainer
@objc public protocol XcodeContainer: SBObjectProtocol, XcodeGenericMethods {
    @objc optional var fullPath: String { get } // The full path to the project file on disk.
    @objc optional var name: String { get } // The name of this project.
    @objc optional var path: String { get } // The path to the project file on disk.
    @objc optional var readOnly: Bool { get } // Is the project only open for reading?
    @objc optional var realPath: String { get } // The fully resolved path to the project file on disk. Specifically, all symlinks in the path have been resolved.
    @objc optional var rootGroup: XcodeGroup { get } // The root of the files & groups hierarchy in the project.
}
extension SBObject: XcodeContainer {}

// MARK: XcodeContainerItem
@objc public protocol XcodeContainerItem: SBObjectProtocol, XcodeGenericMethods {
    @objc optional func id() -> String // The unique identifier for the project item.
    @objc optional var comments: String { get } // Comments about this project item.
    @objc optional var container: XcodeContainer { get } // The container for this item.
    @objc optional var project: XcodeProject { get } // The project that contains this item.
    @objc optional func setComments(_ comments: String!) // Comments about this project item.
}
extension SBObject: XcodeContainerItem {}

// MARK: XcodeProject
@objc public protocol XcodeProject: XcodeContainer {
    @objc optional func buildConfigurations() -> SBElementArray
    @objc optional func buildConfigurationTypes() -> SBElementArray
    @objc optional func fileReferences() -> SBElementArray
    @objc optional func groups() -> SBElementArray
    @objc optional func itemReferences() -> SBElementArray
    @objc optional func schemes() -> SBElementArray
    @objc optional func targets() -> SBElementArray
    @objc optional func Xcode3Groups() -> SBElementArray
    @objc optional func Xcode3FileReferences() -> SBElementArray
    @objc optional var defaultBuildConfigurationType: XcodeBuildConfigurationType { get } // The default build configuration type used when building with xcodebuild if no -configuration option is supplied.
    @objc optional func id() -> String // The unique identifier for the project.
    @objc optional var organizationName: String { get } // The name to use in the header file of new files created with project templates.  Defaults to Apple Inc.
    @objc optional var projectDirectory: String { get } // The full path to the folder that contains the project file.
    @objc optional var projectFileReference: XcodeFileReference { get } // A file reference to the core project.pbxproj file itself.
    @objc optional var userFileReference: XcodeFileReference { get } // A file reference to the current user's pbxuser file.
    @objc optional func setDefaultBuildConfigurationType(_ defaultBuildConfigurationType: XcodeBuildConfigurationType!) // The default build configuration type used when building with xcodebuild if no -configuration option is supplied.
    @objc optional func setOrganizationName(_ organizationName: String!) // The name to use in the header file of new files created with project templates.  Defaults to Apple Inc.
}
extension SBObject: XcodeProject {}

// MARK: XcodeProjectItem
@objc public protocol XcodeProjectItem: XcodeContainerItem {
    @objc optional func id() -> String // The unique identifier for the project item.
    @objc optional func moveTo(_ to: SBObject!) // Moves an existing object to the container specified.
}
extension SBObject: XcodeProjectItem {}

// MARK: XcodeBuildPhase
@objc public protocol XcodeBuildPhase: XcodeProjectItem {
    @objc optional func buildFiles() -> SBElementArray
    @objc optional var name: String { get } // The name of this build phase.
    @objc optional var target: XcodeTarget { get } // The target that contains this build phase.
}
extension SBObject: XcodeBuildPhase {}

// MARK: XcodeBuildJavaResourcesPhase
@objc public protocol XcodeBuildJavaResourcesPhase: XcodeBuildPhase {
}
extension SBObject: XcodeBuildJavaResourcesPhase {}

// MARK: XcodeBuildResourceManagerResourcesPhase
@objc public protocol XcodeBuildResourceManagerResourcesPhase: XcodeBuildPhase {
}
extension SBObject: XcodeBuildResourceManagerResourcesPhase {}

// MARK: XcodeCompileApplescriptsPhase
@objc public protocol XcodeCompileApplescriptsPhase: XcodeBuildPhase {
}
extension SBObject: XcodeCompileApplescriptsPhase {}

// MARK: XcodeCompileSourcesPhase
@objc public protocol XcodeCompileSourcesPhase: XcodeBuildPhase {
}
extension SBObject: XcodeCompileSourcesPhase {}

// MARK: XcodeCopyBundleResourcesPhase
@objc public protocol XcodeCopyBundleResourcesPhase: XcodeBuildPhase {
}
extension SBObject: XcodeCopyBundleResourcesPhase {}

// MARK: XcodeCopyFilesPhase
@objc public protocol XcodeCopyFilesPhase: XcodeBuildPhase {
    @objc optional var destinationDirectory: XcodePwpa { get } // The base location to copy items relative to. If "root volume" is chosen then "path" is an absolute path. Otherwise "path" is relative to the base location.
    @objc optional var path: String { get } // The path relative to the destination to copy items to
    @objc optional var runOnlyWhenInstalling: Bool { get } // Indicates if the build phase should only be run when performing an install build.
    @objc optional func setDestinationDirectory(_ destinationDirectory: XcodePwpa) // The base location to copy items relative to. If "root volume" is chosen then "path" is an absolute path. Otherwise "path" is relative to the base location.
    @objc optional func setPath(_ path: String!) // The path relative to the destination to copy items to
    @objc optional func setRunOnlyWhenInstalling(_ runOnlyWhenInstalling: Bool) // Indicates if the build phase should only be run when performing an install build.
}
extension SBObject: XcodeCopyFilesPhase {}

// MARK: XcodeCopyHeadersPhase
@objc public protocol XcodeCopyHeadersPhase: XcodeBuildPhase {
}
extension SBObject: XcodeCopyHeadersPhase {}

// MARK: XcodeLinkBinaryWithLibrariesPhase
@objc public protocol XcodeLinkBinaryWithLibrariesPhase: XcodeBuildPhase {
}
extension SBObject: XcodeLinkBinaryWithLibrariesPhase {}

// MARK: XcodeRunScriptPhase
@objc public protocol XcodeRunScriptPhase: XcodeBuildPhase {
    @objc optional func inputPaths() -> SBElementArray
    @objc optional func outputPaths() -> SBElementArray
    @objc optional var runOnlyWhenInstalling: Bool { get } // Indicates if the build phase should only be run when performing an install build.
    @objc optional var shellPath: String { get } // The absolute path to the shell used by the shell script.
    @objc optional var shellScript: String { get } // The actual shell script to run during this build phase.
    @objc optional var showEnvironmentVariables: Bool { get } // Indicates if shell environment variables should be output to the build log.
    @objc optional func setRunOnlyWhenInstalling(_ runOnlyWhenInstalling: Bool) // Indicates if the build phase should only be run when performing an install build.
    @objc optional func setShellPath(_ shellPath: String!) // The absolute path to the shell used by the shell script.
    @objc optional func setShellScript(_ shellScript: String!) // The actual shell script to run during this build phase.
    @objc optional func setShowEnvironmentVariables(_ showEnvironmentVariables: Bool) // Indicates if shell environment variables should be output to the build log.
}
extension SBObject: XcodeRunScriptPhase {}

// MARK: XcodeBreakpoint
@objc public protocol XcodeBreakpoint: XcodeProjectItem {
    @objc optional var automaticallyContinue: Bool { get } // Should the debugger automatically continue when it hits this breakpoint after performing any associated breakpoint actions?
    @objc optional var condition: String { get } // Condition in which breakpoint should stop.
    @objc optional var enabled: Bool { get } // Is the breakpoint enabled?
    @objc optional var name: String { get } // The name of this breakpoint.
    @objc optional func setAutomaticallyContinue(_ automaticallyContinue: Bool) // Should the debugger automatically continue when it hits this breakpoint after performing any associated breakpoint actions?
    @objc optional func setCondition(_ condition: String!) // Condition in which breakpoint should stop.
    @objc optional func setEnabled(_ enabled: Bool) // Is the breakpoint enabled?
}
extension SBObject: XcodeBreakpoint {}

// MARK: XcodeBuildConfiguration
@objc public protocol XcodeBuildConfiguration: XcodeProjectItem {
    @objc optional func baseBuildSettings() -> SBElementArray
    @objc optional func buildSettings() -> SBElementArray
    @objc optional func flattenedBuildSettings() -> SBElementArray
    @objc optional var buildConfigurationType: XcodeBuildConfigurationType { get } // The associated build configuration type.
    @objc optional var configurationSettingsFile: XcodeFileReference { get } // The optional configuration settings file this configuration is based on. May be 'missing value'.
    @objc optional var name: String { get } // The name of the associated build configuration type.
    @objc optional func setConfigurationSettingsFile(_ configurationSettingsFile: XcodeFileReference!) // The optional configuration settings file this configuration is based on. May be 'missing value'.
}
extension SBObject: XcodeBuildConfiguration {}

// MARK: XcodeBuildFile
@objc public protocol XcodeBuildFile: XcodeProjectItem {
    @objc optional func buildMessages() -> SBElementArray
    @objc optional var buildPhase: XcodeBuildPhase { get } // The build phase that this build file is contained by.
    @objc optional var compiledCodeSize: Int { get } // The size of the object file generated when compiling the associated file.
    @objc optional var fileReference: XcodeFileReference { get } // A file reference to the file on disk that this build file represents.
    @objc optional var name: String { get } // The name of this build file.
    @objc optional var target: XcodeTarget { get } // The target that contains this build file.
}
extension SBObject: XcodeBuildFile {}

// MARK: XcodeFileBreakpoint
@objc public protocol XcodeFileBreakpoint: XcodeBreakpoint {
    @objc optional var fileReference: XcodeFileReference { get } // A reference to the file that contains the breakpoint.
    @objc optional var lineNumber: Int { get } // The line number the breakpoint is set on.
    @objc optional func setFileReference(_ fileReference: XcodeFileReference!) // A reference to the file that contains the breakpoint.
    @objc optional func setLineNumber(_ lineNumber: Int) // The line number the breakpoint is set on.
}
extension SBObject: XcodeFileBreakpoint {}

// MARK: XcodeProjectTemplate
@objc public protocol XcodeProjectTemplate: SBObjectProtocol, XcodeGenericMethods {
    @objc optional var name: String { get } // The name for the project template.
    @objc optional var objectDescription: String { get } // A description of the project template.
}
extension SBObject: XcodeProjectTemplate {}

// MARK: XcodeScheme
@objc public protocol XcodeScheme: SBObjectProtocol {
    @objc optional var name: String { get } // The name of the scheme.
}
extension SBObject: XcodeScheme {}

// MARK: XcodeSymbolicBreakpoint
@objc public protocol XcodeSymbolicBreakpoint: XcodeBreakpoint {
    @objc optional var symbolName: String { get } // The name of the symbol that the breakpoint stops at.
    @objc optional func setSymbolName(_ symbolName: String!) // The name of the symbol that the breakpoint stops at.
}
extension SBObject: XcodeSymbolicBreakpoint {}

// MARK: XcodeItemReference
@objc public protocol XcodeItemReference: XcodeContainerItem {
    @objc optional var buildProductsRelativePath: String { get } // The path to the item referenced relative to the build products folder.
    @objc optional var contents: [SBObject] { get } // A list of the immediate contents of this reference.
    @objc optional var entireContents: [SBObject] { get } // A list of the contents of this reference, including the entire contents of its children.
    @objc optional var fileEncoding: XcodeFenc { get } // The file encoding used to display the contents of any text files referenced by this item. In the case of a group or folder reference, this encoding is used for the items contained by this item.
    @objc optional var fullPath: String { get } // The full path to the item referenced.
    @objc optional var group: XcodeGroup { get } // The group that this reference is contained in.
    @objc optional var indentWidth: Int { get } // The number of spaces to indent wrapped lines in the referenced item. In the case of a group or folder reference, this indent width is used for any contained items.
    @objc optional var leaf: Bool { get } // Indicates if this reference cannot contain other references.
    @objc optional var lineEnding: XcodeLied { get } // The style of line endings to use for the referenced item. In the case of a group or folder reference, this style is used for any contained items.
    @objc optional var localized: Bool { get } // Indicates if this reference refers to a localized item.
    @objc optional var name: String { get } // The name of this item reference.
    @objc optional var path: String { get } // Returns the path to the item referenced. The format of this path depends on the path type.
    @objc optional var pathType: XcodeReft { get } // Specifies how the reference tries to locate the item it refers to. Xcode does not provide full scripting support to user-defined source trees, and will report such reference types as "other".
    @objc optional var projectRelativePath: String { get } // The project relative path to the item referenced.
    @objc optional var realPath: String { get } // The fully resolved path to the item referenced. Specifically, all symlinks in the path have been resolved.
    @objc optional var tabWidth: Int { get } // The number of spaces to use for a tab for the referenced item. In the case of a group or folder reference, this value is used for any contained items.
    @objc optional var usesTabs: Bool { get } // Indicates if tabs characters should be used instead of spaces when entering tabs. In the case of a group or folder reference, this value is used for any contained items.
    @objc optional func setFileEncoding(_ fileEncoding: XcodeFenc) // The file encoding used to display the contents of any text files referenced by this item. In the case of a group or folder reference, this encoding is used for the items contained by this item.
    @objc optional func setIndentWidth(_ indentWidth: Int) // The number of spaces to indent wrapped lines in the referenced item. In the case of a group or folder reference, this indent width is used for any contained items.
    @objc optional func setLineEnding(_ lineEnding: XcodeLied) // The style of line endings to use for the referenced item. In the case of a group or folder reference, this style is used for any contained items.
    @objc optional func setName(_ name: String!) // The name of this item reference.
    @objc optional func setPathType(_ pathType: XcodeReft) // Specifies how the reference tries to locate the item it refers to. Xcode does not provide full scripting support to user-defined source trees, and will report such reference types as "other".
    @objc optional func setTabWidth(_ tabWidth: Int) // The number of spaces to use for a tab for the referenced item. In the case of a group or folder reference, this value is used for any contained items.
    @objc optional func setUsesTabs(_ usesTabs: Bool) // Indicates if tabs characters should be used instead of spaces when entering tabs. In the case of a group or folder reference, this value is used for any contained items.
}
extension SBObject: XcodeItemReference {}

// MARK: XcodeFileReference
@objc public protocol XcodeFileReference: XcodeItemReference {
    @objc optional var fileKind: String { get } // The identifier for the file type used when referencing the file.
    @objc optional var headRevisionNumber: String { get } // The current SCM head revision for the referenced file. If the file is on a branch this is the top of the branch, not the top of the tree.
    @objc optional var revisionNumber: String { get } // The current SCM revision for the referenced file.
    @objc optional var status: XcodeAsms { get } // The current SCM status for the referenced file.
    @objc optional var tag: String { get } // The current SCM tag for the referenced file.
}
extension SBObject: XcodeFileReference {}

// MARK: XcodeGroup
@objc public protocol XcodeGroup: XcodeItemReference {
    @objc optional func fileReferences() -> SBElementArray
    @objc optional func groups() -> SBElementArray
    @objc optional func itemReferences() -> SBElementArray
}
extension SBObject: XcodeGroup {}

// MARK: XcodeXcode3FileReference
@objc public protocol XcodeXcode3FileReference: XcodeFileReference {
    @objc optional func Xcode3FileReferences() -> SBElementArray
    @objc optional var path: String { get } // Returns the path to the item referenced. The format of this path depends on the path type.
    @objc optional var pathType: XcodeReft { get } // Specifies how the reference tries to locate the item it refers to. Xcode does not provide full scripting support to user-defined source trees, and will report such reference types as "other".
    @objc optional func setPath(_ path: String!) // Returns the path to the item referenced. The format of this path depends on the path type.
    @objc optional func setPathType(_ pathType: XcodeReft) // Specifies how the reference tries to locate the item it refers to. Xcode does not provide full scripting support to user-defined source trees, and will report such reference types as "other".
}
extension SBObject: XcodeXcode3FileReference {}

// MARK: XcodeXcode3Group
@objc public protocol XcodeXcode3Group: XcodeGroup {
    @objc optional func Xcode3FileReferences() -> SBElementArray
    @objc optional func Xcode3Groups() -> SBElementArray
    @objc optional var path: String { get } // Returns the path to the item referenced. The format of this path depends on the path type.
    @objc optional var pathType: XcodeReft { get } // Specifies how the reference tries to locate the item it refers to. Xcode does not provide full scripting support to user-defined source trees, and will report such reference types as "other".
    @objc optional func setPath(_ path: String!) // Returns the path to the item referenced. The format of this path depends on the path type.
    @objc optional func setPathType(_ pathType: XcodeReft) // Specifies how the reference tries to locate the item it refers to. Xcode does not provide full scripting support to user-defined source trees, and will report such reference types as "other".
}
extension SBObject: XcodeXcode3Group {}

// MARK: XcodeBuildSetting
@objc public protocol XcodeBuildSetting: SBObjectProtocol, XcodeGenericMethods {
    @objc optional var container: XcodeProjectItem { get } // The build configuration that contains this build setting.
    @objc optional var name: String { get } // The unlocalized build setting name (e.g. DSTROOT).
    @objc optional var value: String { get } // A string value for the build setting.
    @objc optional func setName(_ name: String!) // The unlocalized build setting name (e.g. DSTROOT).
    @objc optional func setValue(_ value: String!) // A string value for the build setting.
}
extension SBObject: XcodeBuildSetting {}

// MARK: XcodeBaseBuildSetting
@objc public protocol XcodeBaseBuildSetting: XcodeBuildSetting {
}
extension SBObject: XcodeBaseBuildSetting {}

// MARK: XcodeFlattenedBuildSetting
@objc public protocol XcodeFlattenedBuildSetting: XcodeBuildSetting {
}
extension SBObject: XcodeFlattenedBuildSetting {}

// MARK: XcodeTarget
@objc public protocol XcodeTarget: XcodeProjectItem {
    @objc optional func buildConfigurations() -> SBElementArray
    @objc optional func buildFiles() -> SBElementArray
    @objc optional func buildPhases() -> SBElementArray
    @objc optional func compileApplescriptsPhases() -> SBElementArray
    @objc optional func copyFilesPhases() -> SBElementArray
    @objc optional func runScriptPhases() -> SBElementArray
    @objc optional func targetDependencies() -> SBElementArray
    @objc optional var buildJavaResourcesPhase: XcodeBuildJavaResourcesPhase { get } // The "Build Java Resources" build phase for this target if it exists.
    @objc optional var buildResourceManagerResourcesPhase: XcodeBuildResourceManagerResourcesPhase { get } // The "Build Resource Manager Resources" build phase for this target if it exists.
    @objc optional var compileSourcesPhase: XcodeCompileSourcesPhase { get } // The "Compile Sources" build phase for this target if it exists.
    @objc optional var copyBundleResourcesPhase: XcodeCopyBundleResourcesPhase { get } // The "Copy Bundle Resources" build phase for this target if it exists.
    @objc optional var copyHeadersPhase: XcodeCopyHeadersPhase { get } // The "Copy Headers" build phase for this target if it exists.
    @objc optional var linkBinaryWithLibrariesPhase: XcodeLinkBinaryWithLibrariesPhase { get } // The "Link Binary with Libraries" build phase for this target if it exists.
    @objc optional var name: String { get } // The name of this target.
    @objc optional var native: Bool { get } // Does this target use the native build system?
    @objc optional var productReference: XcodeFileReference { get } // An item reference to the generated product on disk.
    @objc optional var targetType: String { get } // The type of target. Usually this is related to the type of product the target produces.
    @objc optional func setName(_ name: String!) // The name of this target.
}
extension SBObject: XcodeTarget {}

// MARK: XcodeTargetDependency
@objc public protocol XcodeTargetDependency: XcodeProjectItem {
    @objc optional var target: XcodeTarget { get } // The target that the containing target depends on.
}
extension SBObject: XcodeTargetDependency {}

// MARK: XcodeInsertionPoint
@objc public protocol XcodeInsertionPoint: SBObjectProtocol, XcodeGenericMethods {
    @objc optional var contents: String { get } // The contents at the insertion point.
    @objc optional func setContents(_ contents: String!) // The contents at the insertion point.
}
extension SBObject: XcodeInsertionPoint {}

// MARK: XcodeFileDocument
@objc public protocol XcodeFileDocument: XcodeDocument {
}
extension SBObject: XcodeFileDocument {}

// MARK: XcodeTextDocument
@objc public protocol XcodeTextDocument: XcodeFileDocument {
    @objc optional var contents: String { get } // The contents of the text file.
    @objc optional var notifiesWhenClosing: Bool { get } // Should Xcode notify other apps when this document is closed?
    @objc optional var selectedCharacterRange: [NSNumber] { get } // The first and last character positions in the selection.
    @objc optional var selectedParagraphRange: [NSNumber] { get } // The first and last paragraph positions that contain the selection.
    @objc optional var selection: SBObject { get } // The current selection in the text document.
    @objc optional var text: String { get } // The text of the text file referenced.
    @objc optional func setContents(_ contents: String!) // The contents of the text file.
    @objc optional func setNotifiesWhenClosing(_ notifiesWhenClosing: Bool) // Should Xcode notify other apps when this document is closed?
    @objc optional func setSelectedCharacterRange(_ selectedCharacterRange: [NSNumber]!) // The first and last character positions in the selection.
    @objc optional func setSelectedParagraphRange(_ selectedParagraphRange: [NSNumber]!) // The first and last paragraph positions that contain the selection.
    @objc optional func setSelection(_ selection: SBObject!) // The current selection in the text document.
    @objc optional func setText(_ text: String!) // The text of the text file referenced.
}
extension SBObject: XcodeTextDocument {}

// MARK: XcodeSourceDocument
@objc public protocol XcodeSourceDocument: XcodeTextDocument {
    @objc optional var editorSettings: [AnyHashable : Any] { get } // A record of source editor settings and values.
    @objc optional func setEditorSettings(_ editorSettings: [AnyHashable : Any]!) // A record of source editor settings and values.
}
extension SBObject: XcodeSourceDocument {}

// MARK: XcodeWorkspaceDocument
@objc public protocol XcodeWorkspaceDocument: XcodeDocument {
    @objc optional var loaded: Bool { get } // Is the attribute optional?
    @objc optional func breakpoints() -> SBElementArray
    @objc optional func buildMessages() -> SBElementArray
    @objc optional func fileBreakpoints() -> SBElementArray
    @objc optional func fileReferences() -> SBElementArray
    @objc optional func groups() -> SBElementArray
    @objc optional func itemReferences() -> SBElementArray
    @objc optional func projects() -> SBElementArray
    @objc optional func schemes() -> SBElementArray
    @objc optional func symbolicBreakpoints() -> SBElementArray
    @objc optional func Xcode3Groups() -> SBElementArray
    @objc optional func Xcode3FileReferences() -> SBElementArray
    @objc optional var activeScheme: XcodeScheme { get } // The workspace's scheme that will be used for scheme actions.
    @objc optional var breakpointsEnabled: Bool { get } // Are breakpoints enabled in this workspace?
    @objc optional var intermediatesDirectory: String { get } // The full path to the folder that contains all intermediate files for the project.
    @objc optional var productDirectory: String { get } // The full path to the folder that contains any built products.
    @objc optional func setBreakpointsEnabled(_ breakpointsEnabled: Bool) // Are breakpoints enabled in this workspace?
    @objc optional func setIntermediatesDirectory(_ intermediatesDirectory: String!) // The full path to the folder that contains all intermediate files for the project.
    @objc optional func setProductDirectory(_ productDirectory: String!) // The full path to the folder that contains any built products.
}
extension SBObject: XcodeWorkspaceDocument {}

// MARK: XcodeAttribute
@objc public protocol XcodeAttribute: SBObjectProtocol, XcodeGenericMethods {
    @objc optional var attributeType: String { get } // The CoreData type of the attribute
    @objc optional var defaultValue: String { get } // Default value of the attribute
    @objc optional var name: String { get } // Attribute name
    @objc optional var optional: Bool { get } // Is the attribute optional?
    @objc optional var transient: Bool { get } // Is the attribute transient?
    @objc optional var userInfo: [AnyHashable : Any] { get } // User info dictionary for the attribute
    @objc optional func setName(_ name: String!) // Attribute name
    @objc optional func setOptional(_ optional: Bool) // Is the attribute optional?
    @objc optional func setTransient(_ transient: Bool) // Is the attribute transient?
    @objc optional func setUserInfo(_ userInfo: [AnyHashable : Any]!) // User info dictionary for the attribute
}
extension SBObject: XcodeAttribute {}

// MARK: XcodeDataModelDocument
@objc public protocol XcodeDataModelDocument: XcodeFileDocument {
    @objc optional func entities() -> SBElementArray
    @objc optional var name: String { get } // The name of the document
}
extension SBObject: XcodeDataModelDocument {}

// MARK: XcodeEntity
@objc public protocol XcodeEntity: SBObjectProtocol, XcodeGenericMethods {
    @objc optional func attributes() -> SBElementArray
    @objc optional func fetchRequests() -> SBElementArray
    @objc optional func fetchedProperties() -> SBElementArray
    @objc optional func relationships() -> SBElementArray
    @objc optional var abstract: Bool { get } // Is the entity abstract?
    @objc optional var name: String { get } // Name of the entity
    @objc optional var objectClass: String { get } // The Objective C class of the object backing this entity
    @objc optional var parent: XcodeEntity { get } // Parent from which the entity inherits
    @objc optional var userInfo: [AnyHashable : Any] { get } // User info dictionary for the entity
    @objc optional func setAbstract(_ abstract: Bool) // Is the entity abstract?
    @objc optional func setName(_ name: String!) // Name of the entity
    @objc optional func setObjectClass(_ objectClass: String!) // The Objective C class of the object backing this entity
    @objc optional func setUserInfo(_ userInfo: [AnyHashable : Any]!) // User info dictionary for the entity
}
extension SBObject: XcodeEntity {}

// MARK: XcodeFetchRequest
@objc public protocol XcodeFetchRequest: SBObjectProtocol, XcodeGenericMethods {
    @objc optional var name: String { get } // Fetch Request name
    @objc optional var predicate: String { get } // Text form of the predicate for the Fetch Request
    @objc optional func setName(_ name: String!) // Fetch Request name
    @objc optional func setPredicate(_ predicate: String!) // Text form of the predicate for the Fetch Request
}
extension SBObject: XcodeFetchRequest {}

// MARK: XcodeFetchedProperty
@objc public protocol XcodeFetchedProperty: SBObjectProtocol, XcodeGenericMethods {
    @objc optional var destination: XcodeEntity { get } // The destination entity of the fetched property
    @objc optional var name: String { get } // Fetched Property attribute name
    @objc optional var optional: Bool { get } // Is the attribute optional?
    @objc optional var predicate: String { get } // Text form of the predicate that selects the property
    @objc optional var transient: Bool { get } // Is the attribute transient?
    @objc optional var userInfo: [AnyHashable : Any] { get } // User info dictionary for the attribute
    @objc optional func setDestination(_ destination: XcodeEntity!) // The destination entity of the fetched property
    @objc optional func setName(_ name: String!) // Fetched Property attribute name
    @objc optional func setOptional(_ optional: Bool) // Is the attribute optional?
    @objc optional func setPredicate(_ predicate: String!) // Text form of the predicate that selects the property
    @objc optional func setTransient(_ transient: Bool) // Is the attribute transient?
    @objc optional func setUserInfo(_ userInfo: [AnyHashable : Any]!) // User info dictionary for the attribute
}
extension SBObject: XcodeFetchedProperty {}

// MARK: XcodeRelationship
@objc public protocol XcodeRelationship: SBObjectProtocol, XcodeGenericMethods {
    @objc optional var destinationEntity: XcodeEntity { get } // The other entity related to this one.
    @objc optional var inverseRelationship: XcodeRelationship { get } // The relationship that the related element has to this one.
    @objc optional var maximumCount: Int { get } // Maximum number of related data objects
    @objc optional var minimumCount: Int { get } // Minimum number of related data objects
    @objc optional var name: String { get } // Name of the relationship
    @objc optional var optional: Bool { get } // Is the relationship optional?
    @objc optional var toMany: Bool { get } // Is the relationship a “to-many” relationship?
    @objc optional var transient: Bool { get } // Is the relationship transient?
    @objc optional var userInfo: [AnyHashable : Any] { get } // User information dictionary for the relationship
    @objc optional func setDestinationEntity(_ destinationEntity: XcodeEntity!) // The other entity related to this one.
    @objc optional func setInverseRelationship(_ inverseRelationship: XcodeRelationship!) // The relationship that the related element has to this one.
    @objc optional func setMaximumCount(_ maximumCount: Int) // Maximum number of related data objects
    @objc optional func setMinimumCount(_ minimumCount: Int) // Minimum number of related data objects
    @objc optional func setName(_ name: String!) // Name of the relationship
    @objc optional func setOptional(_ optional: Bool) // Is the relationship optional?
    @objc optional func setToMany(_ toMany: Bool) // Is the relationship a “to-many” relationship?
    @objc optional func setTransient(_ transient: Bool) // Is the relationship transient?
    @objc optional func setUserInfo(_ userInfo: [AnyHashable : Any]!) // User information dictionary for the relationship
}
extension SBObject: XcodeRelationship {}

