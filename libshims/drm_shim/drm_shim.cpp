/*
 * Copyright (C) 2018 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <android-base/logging.h>

//LogMessage::LogMessage(const char* file, unsigned int line, LogId id, LogSeverity severity, const char* tag, int error)
extern "C" void* _ZN7android4base10LogMessageC1EPKcjNS0_5LogIdENS0_11LogSeverityES3_i(const char* file, unsigned int line, android::base::LogId id, android::base::LogSeverity severity, const char* tag, int error);

//LogMessage::LogMessage(const char* file, unsigned int line, LogId id, LogSeverity severity, int error)
extern "C" void* _ZN7android4base10LogMessageC1EPKcjNS0_5LogIdENS0_11LogSeverityEi(const char* file, unsigned int line, android::base::LogId id, android::base::LogSeverity severity, int error){
    return _ZN7android4base10LogMessageC1EPKcjNS0_5LogIdENS0_11LogSeverityES3_i(file, line, id, severity, "<unknown>", error);
}

