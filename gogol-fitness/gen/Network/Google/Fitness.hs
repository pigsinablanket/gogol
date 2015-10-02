{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE TypeOperators #-}

{-# OPTIONS_GHC -fno-warn-unused-imports    #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}

-- |
-- Module      : Network.Google.Fitness
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- -- | Google Fit API
--
-- /See:/ <https://developers.google.com/fit/rest/ Fitness Reference>
module Network.Google.Fitness
    (
    -- * API
      FitnessAPI
    , fitnessAPI
    , fitnessURL

    -- * Service Methods

    -- * REST Resources

    -- ** FitnessUsersDataSourcesCreate
    , module Network.Google.Resource.Fitness.Users.DataSources.Create

    -- ** FitnessUsersDataSourcesDatasetsDelete
    , module Network.Google.Resource.Fitness.Users.DataSources.Datasets.Delete

    -- ** FitnessUsersDataSourcesDatasetsGet
    , module Network.Google.Resource.Fitness.Users.DataSources.Datasets.Get

    -- ** FitnessUsersDataSourcesDatasetsPatch
    , module Network.Google.Resource.Fitness.Users.DataSources.Datasets.Patch

    -- ** FitnessUsersDataSourcesDelete
    , module Network.Google.Resource.Fitness.Users.DataSources.Delete

    -- ** FitnessUsersDataSourcesGet
    , module Network.Google.Resource.Fitness.Users.DataSources.Get

    -- ** FitnessUsersDataSourcesList
    , module Network.Google.Resource.Fitness.Users.DataSources.List

    -- ** FitnessUsersDataSourcesPatch
    , module Network.Google.Resource.Fitness.Users.DataSources.Patch

    -- ** FitnessUsersDataSourcesUpdate
    , module Network.Google.Resource.Fitness.Users.DataSources.Update

    -- ** FitnessUsersDatasetAggregate
    , module Network.Google.Resource.Fitness.Users.Dataset.Aggregate

    -- ** FitnessUsersSessionsDelete
    , module Network.Google.Resource.Fitness.Users.Sessions.Delete

    -- ** FitnessUsersSessionsList
    , module Network.Google.Resource.Fitness.Users.Sessions.List

    -- ** FitnessUsersSessionsUpdate
    , module Network.Google.Resource.Fitness.Users.Sessions.Update

    -- * Types

    -- ** AggregateBucketType
    , AggregateBucketType (..)

    -- ** Application
    , Application
    , application
    , aPackageName
    , aName
    , aVersion
    , aDetailsURL

    -- ** AggregateBy
    , AggregateBy
    , aggregateBy
    , abDataTypeName
    , abDataSourceId

    -- ** AggregateResponse
    , AggregateResponse
    , aggregateResponse
    , arBucket

    -- ** Dataset
    , Dataset
    , dataset
    , dNextPageToken
    , dDataSourceId
    , dPoint
    , dMinStartTimeNs
    , dMaxEndTimeNs

    -- ** DataSourceType
    , DataSourceType (..)

    -- ** AggregateRequest
    , AggregateRequest
    , aggregateRequest
    , arEndTimeMillis
    , arAggregateBy
    , arBucketBySession
    , arBucketByActivityType
    , arBucketByTime
    , arStartTimeMillis
    , arBucketByActivitySegment

    -- ** BucketByActivity
    , BucketByActivity
    , bucketByActivity
    , bbaMinDurationMillis
    , bbaActivityDataSourceId

    -- ** Device
    , Device
    , device
    , dManufacturer
    , dUid
    , dModel
    , dVersion
    , dType

    -- ** BucketBySession
    , BucketBySession
    , bucketBySession
    , bbsMinDurationMillis

    -- ** Value
    , Value
    , value
    , vMapVal
    , vFpVal
    , vIntVal
    , vStringVal

    -- ** ListSessionsResponse
    , ListSessionsResponse
    , listSessionsResponse
    , lsrNextPageToken
    , lsrDeletedSession
    , lsrSession

    -- ** DataPoint
    , DataPoint
    , dataPoint
    , dpOriginDataSourceId
    , dpRawTimestampNanos
    , dpDataTypeName
    , dpValue
    , dpComputationTimeMillis
    , dpEndTimeNanos
    , dpModifiedTimeMillis
    , dpStartTimeNanos

    -- ** AggregateBucket
    , AggregateBucket
    , aggregateBucket
    , abEndTimeMillis
    , abDataset
    , abActivity
    , abType
    , abStartTimeMillis
    , abSession

    -- ** ListDataSourcesResponse
    , ListDataSourcesResponse
    , listDataSourcesResponse
    , ldsrDataSource

    -- ** MapValue
    , MapValue
    , mapValue
    , mvFpVal

    -- ** DataTypeField
    , DataTypeField
    , dataTypeField
    , dtfFormat
    , dtfName
    , dtfOptional

    -- ** DataSource
    , DataSource
    , dataSource
    , dsApplication
    , dsDevice
    , dsName
    , dsDataType
    , dsType
    , dsDataStreamName
    , dsDataStreamId

    -- ** ValueMapValEntry
    , ValueMapValEntry
    , valueMapValEntry
    , vmveValue
    , vmveKey

    -- ** DataType
    , DataType
    , dataType
    , dtField
    , dtName

    -- ** DeviceType
    , DeviceType (..)

    -- ** BucketByTime
    , BucketByTime
    , bucketByTime
    , bbtDurationMillis

    -- ** Session
    , Session
    , session
    , sEndTimeMillis
    , sActiveTimeMillis
    , sApplication
    , sActivityType
    , sName
    , sModifiedTimeMillis
    , sId
    , sStartTimeMillis
    , sDescription

    -- ** DataTypeFieldFormat
    , DataTypeFieldFormat (..)
    ) where

import           Network.Google.Fitness.Types
import           Network.Google.Prelude
import           Network.Google.Resource.Fitness.Users.Dataset.Aggregate
import           Network.Google.Resource.Fitness.Users.DataSources.Create
import           Network.Google.Resource.Fitness.Users.DataSources.Datasets.Delete
import           Network.Google.Resource.Fitness.Users.DataSources.Datasets.Get
import           Network.Google.Resource.Fitness.Users.DataSources.Datasets.Patch
import           Network.Google.Resource.Fitness.Users.DataSources.Delete
import           Network.Google.Resource.Fitness.Users.DataSources.Get
import           Network.Google.Resource.Fitness.Users.DataSources.List
import           Network.Google.Resource.Fitness.Users.DataSources.Patch
import           Network.Google.Resource.Fitness.Users.DataSources.Update
import           Network.Google.Resource.Fitness.Users.Sessions.Delete
import           Network.Google.Resource.Fitness.Users.Sessions.List
import           Network.Google.Resource.Fitness.Users.Sessions.Update

{- $resources
TODO
-}

type FitnessAPI =
     UsersDatasetAggregateResource :<|>
       UsersDataSourcesDatasetsPatchResource
       :<|> UsersDataSourcesDatasetsGetResource
       :<|> UsersDataSourcesDatasetsDeleteResource
       :<|> UsersDataSourcesListResource
       :<|> UsersDataSourcesPatchResource
       :<|> UsersDataSourcesGetResource
       :<|> UsersDataSourcesCreateResource
       :<|> UsersDataSourcesDeleteResource
       :<|> UsersDataSourcesUpdateResource
       :<|> UsersSessionsListResource
       :<|> UsersSessionsDeleteResource
       :<|> UsersSessionsUpdateResource

fitnessAPI :: Proxy FitnessAPI
fitnessAPI = Proxy