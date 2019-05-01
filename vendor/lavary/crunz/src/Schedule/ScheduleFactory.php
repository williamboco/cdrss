<?php

declare(strict_types=1);

namespace Crunz\Schedule;

use Crunz\Exception\TaskNotExistException;
use Crunz\Schedule;
use Crunz\Task\TaskNumber;

class ScheduleFactory
{
    /**
     * @param TaskNumber                 $taskNumber
     * @param array<int,\Crunz\Schedule> $schedules
     *
     * @return array<int,\Crunz\Schedule>
     *
     * @throws TaskNotExistException
     */
    public function singleTaskSchedule(TaskNumber $taskNumber, Schedule ...$schedules)
    {
        $events = \array_map(
            function (Schedule $schedule) {
                return $schedule->events();
            },
            $schedules
        );

        $flattenEvents = \array_merge(...$events);

        if (!isset($flattenEvents[$taskNumber->asArrayIndex()])) {
            $tasksCount = \count($flattenEvents);
            throw new TaskNotExistException("Task with id '{$taskNumber->asInt()}' not found. Last task id is '{$tasksCount}'.");
        }

        $event = $flattenEvents[$taskNumber->asArrayIndex()];

        $schedule = new Schedule();
        $schedule->events([$event]);

        return [$schedule];
    }
}
