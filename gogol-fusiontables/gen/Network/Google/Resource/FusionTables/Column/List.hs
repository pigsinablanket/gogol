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
-- Module      : Network.Google.Resource.FusionTables.Column.List
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Retrieves a list of columns.
--
-- /See:/ <https://developers.google.com/fusiontables Fusion Tables API Reference> for @FusiontablesColumnList@.
module Network.Google.Resource.FusionTables.Column.List
    (
    -- * REST Resource
      ColumnListResource

    -- * Creating a Request
    , columnList'
    , ColumnList'

    -- * Request Lenses
    , clQuotaUser
    , clPrettyPrint
    , clUserIP
    , clKey
    , clPageToken
    , clOAuthToken
    , clTableId
    , clMaxResults
    , clFields
    ) where

import           Network.Google.FusionTables.Types
import           Network.Google.Prelude

-- | A resource alias for @FusiontablesColumnList@ which the
-- 'ColumnList'' request conforms to.
type ColumnListResource =
     "tables" :>
       Capture "tableId" Text :>
         "columns" :>
           QueryParam "quotaUser" Text :>
             QueryParam "prettyPrint" Bool :>
               QueryParam "userIp" Text :>
                 QueryParam "key" Key :>
                   QueryParam "pageToken" Text :>
                     QueryParam "oauth_token" OAuthToken :>
                       QueryParam "maxResults" Word32 :>
                         QueryParam "fields" Text :>
                           QueryParam "alt" AltJSON :> Get '[JSON] ColumnList

-- | Retrieves a list of columns.
--
-- /See:/ 'columnList'' smart constructor.
data ColumnList' = ColumnList'
    { _clQuotaUser   :: !(Maybe Text)
    , _clPrettyPrint :: !Bool
    , _clUserIP      :: !(Maybe Text)
    , _clKey         :: !(Maybe Key)
    , _clPageToken   :: !(Maybe Text)
    , _clOAuthToken  :: !(Maybe OAuthToken)
    , _clTableId     :: !Text
    , _clMaxResults  :: !(Maybe Word32)
    , _clFields      :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ColumnList'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'clQuotaUser'
--
-- * 'clPrettyPrint'
--
-- * 'clUserIP'
--
-- * 'clKey'
--
-- * 'clPageToken'
--
-- * 'clOAuthToken'
--
-- * 'clTableId'
--
-- * 'clMaxResults'
--
-- * 'clFields'
columnList'
    :: Text -- ^ 'tableId'
    -> ColumnList'
columnList' pClTableId_ =
    ColumnList'
    { _clQuotaUser = Nothing
    , _clPrettyPrint = True
    , _clUserIP = Nothing
    , _clKey = Nothing
    , _clPageToken = Nothing
    , _clOAuthToken = Nothing
    , _clTableId = pClTableId_
    , _clMaxResults = Nothing
    , _clFields = Nothing
    }

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
clQuotaUser :: Lens' ColumnList' (Maybe Text)
clQuotaUser
  = lens _clQuotaUser (\ s a -> s{_clQuotaUser = a})

-- | Returns response with indentations and line breaks.
clPrettyPrint :: Lens' ColumnList' Bool
clPrettyPrint
  = lens _clPrettyPrint
      (\ s a -> s{_clPrettyPrint = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
clUserIP :: Lens' ColumnList' (Maybe Text)
clUserIP = lens _clUserIP (\ s a -> s{_clUserIP = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
clKey :: Lens' ColumnList' (Maybe Key)
clKey = lens _clKey (\ s a -> s{_clKey = a})

-- | Continuation token specifying which result page to return.
clPageToken :: Lens' ColumnList' (Maybe Text)
clPageToken
  = lens _clPageToken (\ s a -> s{_clPageToken = a})

-- | OAuth 2.0 token for the current user.
clOAuthToken :: Lens' ColumnList' (Maybe OAuthToken)
clOAuthToken
  = lens _clOAuthToken (\ s a -> s{_clOAuthToken = a})

-- | Table whose columns are being listed.
clTableId :: Lens' ColumnList' Text
clTableId
  = lens _clTableId (\ s a -> s{_clTableId = a})

-- | Maximum number of columns to return. Default is 5.
clMaxResults :: Lens' ColumnList' (Maybe Word32)
clMaxResults
  = lens _clMaxResults (\ s a -> s{_clMaxResults = a})

-- | Selector specifying which fields to include in a partial response.
clFields :: Lens' ColumnList' (Maybe Text)
clFields = lens _clFields (\ s a -> s{_clFields = a})

instance GoogleAuth ColumnList' where
        authKey = clKey . _Just
        authToken = clOAuthToken . _Just

instance GoogleRequest ColumnList' where
        type Rs ColumnList' = ColumnList
        request = requestWithRoute defReq fusionTablesURL
        requestWithRoute r u ColumnList'{..}
          = go _clQuotaUser (Just _clPrettyPrint) _clUserIP
              _clKey
              _clPageToken
              _clOAuthToken
              _clTableId
              _clMaxResults
              _clFields
              (Just AltJSON)
          where go
                  = clientWithRoute (Proxy :: Proxy ColumnListResource)
                      r
                      u