xcodebuild -alltargets clean

rm -rf "JenkinsBuild"

xcodebuild -target HBR_GIT_TEST PROVISIONING_PROFILE="00000000-0000-0000-0000-000000000000" CONFIGURATION_BUILD_DIR=JenkinsBuild

rm -rf "JenkinsArchive"

xcodebuild -scheme HelloJenkins archive PROVISIONING_PROFILE="00000000-0000-0000-0000-000000000000" CODE_SIGN_IDENTITY="iPhone Developer: Justin Hyland (XXXXXXXXXX)" -archivePath ./JenkinsArchive/HelloJenkins.xcarchive

rm -rf "JenkinsIPAExport"

xcodebuild -exportArchive -exportFormat IPA -exportProvisioningProfile iOS\ Team\ Provisioning\ Profile:\ com.yourAPP.HelloJenkins -archivePath ./JenkinsArchive/HelloJenkins.xcarchive -exportPath ./JenkinsIPAExport/HelloJenkins.ipa