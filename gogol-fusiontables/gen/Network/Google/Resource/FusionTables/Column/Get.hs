{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-unused-imports    #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}

-- |
-- Module      : Network.Google.Resource.FusionTables.Column.Get
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Retrieves a specific column by its ID.
--
-- /See:/ <https://developers.google.com/fusiontables Fusion Tables API Reference> for @FusiontablesColumnGet@.
module Network.Google.Resource.FusionTables.Column.Get
    (
    -- * REST Resource
      ColumnGetResource

    -- * Creating a Request
    , columnGet'
    , ColumnGet'

    -- * Request Lenses
    , cgQuotaUser
    , cgPrettyPrint
    , cgUserIP
    , cgKey
    , cgOAuthToken
    , cgTableId
    , cgColumnId
    , cgFields
    ) where

import           Network.Google.FusionTables.Types
import           Network.Google.Prelude

-- | A resource alias for @FusiontablesColumnGet@ which the
-- 'ColumnGet'' request conforms to.
type ColumnGetResource =
     "tables" :>
       Capture "tableId" Text :>
         "columns" :>
           Capture "columnId" Text :>
             QueryParam "quotaUser" Text :>
               QueryParam "prettyPrint" Bool :>
                 QueryParam "userIp" Text :>
                   QueryParam "key" Key :>
                     QueryParam "oauth_token" OAuthToken :>
                       QueryParam "fields" Text :>
                         QueryParam "alt" AltJSON :> Get '[JSON] Column

-- | Retrieves a specific column by its ID.
--
-- /See:/ 'columnGet'' smart constructor.
data ColumnGet' = ColumnGet'
    { _cgQuotaUser   :: !(Maybe Text)
    , _cgPrettyPrint :: !Bool
    , _cgUserIP      :: !(Maybe Text)
    , _cgKey         :: !(Maybe Key)
    , _cgOAuthToken  :: !(Maybe OAuthToken)
    , _cgTableId     :: !Text
    , _cgColumnId    :: !Text
    , _cgFields      :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ColumnGet'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cgQuotaUser'
--
-- * 'cgPrettyPrint'
--
-- * 'cgUserIP'
--
-- * 'cgKey'
--
-- * 'cgOAuthToken'
--
-- * 'cgTableId'
--
-- * 'cgColumnId'
--
-- * 'cgFields'
columnGet'
    :: Text -- ^ 'tableId'
    -> Text -- ^ 'columnId'
    -> ColumnGet'
columnGet' pCgTableId_ pCgColumnId_ =
    ColumnGet'
    { _cgQuotaUser = Nothing
    , _cgPrettyPrint = True
    , _cgUserIP = Nothing
    , _cgKey = Nothing
    , _cgOAuthToken = Nothing
    , _cgTableId = pCgTableId_
    , _cgColumnId = pCgColumnId_
    , _cgFields = Nothing
    }

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
cgQuotaUser :: Lens' ColumnGet' (Maybe Text)
cgQuotaUser
  = lens _cgQuotaUser (\ s a -> s{_cgQuotaUser = a})

-- | Returns response with indentations and line breaks.
cgPrettyPrint :: Lens' ColumnGet' Bool
cgPrettyPrint
  = lens _cgPrettyPrint
      (\ s a -> s{_cgPrettyPrint = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
cgUserIP :: Lens' ColumnGet' (Maybe Text)
cgUserIP = lens _cgUserIP (\ s a -> s{_cgUserIP = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
cgKey :: Lens' ColumnGet' (Maybe Key)
cgKey = lens _cgKey (\ s a -> s{_cgKey = a})

-- | OAuth 2.0 token for the current user.
cgOAuthToken :: Lens' ColumnGet' (Maybe OAuthToken)
cgOAuthToken
  = lens _cgOAuthToken (\ s a -> s{_cgOAuthToken = a})

-- | Table to which the column belongs.
cgTableId :: Lens' ColumnGet' Text
cgTableId
  = lens _cgTableId (\ s a -> s{_cgTableId = a})

-- | Name or identifier for the column that is being requested.
cgColumnId :: Lens' ColumnGet' Text
cgColumnId
  = lens _cgColumnId (\ s a -> s{_cgColumnId = a})

-- | Selector specifying which fields to include in a partial response.
cgFields :: Lens' ColumnGet' (Maybe Text)
cgFields = lens _cgFields (\ s a -> s{_cgFields = a})

instance GoogleAuth ColumnGet' where
        authKey = cgKey . _Just
        authToken = cgOAuthToken . _Just

instance GoogleRequest ColumnGet' where
        type Rs ColumnGet' = Column
        request = requestWithRoute defReq fusionTablesURL
        requestWithRoute r u ColumnGet'{..}
          = go _cgQuotaUser (Just _cgPrettyPrint) _cgUserIP
              _cgKey
              _cgOAuthToken
              _cgTableId
              _cgColumnId
              _cgFields
              (Just AltJSON)
          where go
                  = clientWithRoute (Proxy :: Proxy ColumnGetResource)
                      r
                      u