//
//  CleanseGithubBrowserTests.swift
//  CleanseGithubBrowserTests
//
//  Created by Mike Lewis on 6/10/16.
//  Copyright © 2016 Square, Inc. All rights reserved.
//

import XCTest
@testable import CleanseGithubBrowser
import Cleanse

/// Using the DI framework doens't mean its required to unit test its components.
class CleanseGithubBrowserTests: XCTestCase {
    func testMembersViewController_Title() {
        // Tests that the member's view controller sets the title appropriately.
        let factory = Factory<AssistedInjectionTags.MembersPageSettingsSeed> { _ in
            return MembersPageSettings()
        }
        let vc = MembersViewController(
            memberService: FakeGithubMembersService(),
            githubOrganizationName: .init(value: "Organiztion Name"),
            settings: factory
        )

        XCTAssertEqual(vc.navigationItem.title, "Members of Organiztion Name")
        XCTAssertEqual(vc.title, "Members")
    }
}
