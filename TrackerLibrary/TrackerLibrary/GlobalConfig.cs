using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TrackerLibrary.DataAccess;

namespace TrackerLibrary
{
    public static class GlobalConfig
    {
        public const string PRIZESFILE = "PrizeModels.csv";
        public const string PEOPLEFILE = "PersonModels.csv";
        public const string TEAMFILE = "TeamModels.csv";
        public const string TOURNAMENTFILE = "TournamentModels.csv";
        public const string MATCHUPFILE = "MatchupModels.csv";
        public const string MATCHUPENTRIESFILE = "MatchupEntryModels.csv";
        public static IDataConnection Connection { get; private set; }
        public static void InitializeConnections(DatabaseType db)
        {
           // switch (db)
            //{
              //  case DatabaseType.Sql:
                //    break;
                //case DatabaseType.TextFile:
                //    break;
                //default:
                 //   break;
           // }
            if (db == DatabaseType.Sql)
            {
                // TODO - Set up the SQL connector properly
                SQLConnector sql = new SQLConnector();
                Connection = sql;
            }
            else if (db == DatabaseType.TextFile)
            {
                // TODO - Create the text connection
                TextConnector text = new TextConnector();
                Connection = text;
            }
        }
        public static string cnnString(string name)
        {
            return ConfigurationManager.ConnectionStrings[name].ConnectionString;
        }
        public static string AppKeyLookup(string key)
        {
            return ConfigurationManager.AppSettings[key];
        }
    }
}
