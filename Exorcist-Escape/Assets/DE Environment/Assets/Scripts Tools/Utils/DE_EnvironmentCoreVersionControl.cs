namespace DEEnvironmentCore
{
    public static class SchematicVersionControl
    {
        public static readonly string VERSION = "11.2.0";
        public static readonly string LASTMODIFIED = "03.25.2024";
        public static readonly string CHANGELOG =

            "11.2.0 - 03.25.2024\n" +
            "- See DE Change Log\n\n" +

            "1.0.0 - 12.01.2020\n" +
            "- Initial release\n";


#if UNITY_EDITOR
        [UnityEditor.MenuItem("Window/DE Environment/Version Control/DE Script Version", priority = 41)]
        public static void ShowChangelog()
        {
            UnityEditor.EditorUtility.DisplayDialog(
                "DE Environment Script Version Control",
                "Current DE Version: " + VERSION + "\n\n" +
                "Last Modified: " + LASTMODIFIED + "\n\n" +
                "Changelog:\n" + CHANGELOG,
                "ok"
                );
        }
#endif
    }
}